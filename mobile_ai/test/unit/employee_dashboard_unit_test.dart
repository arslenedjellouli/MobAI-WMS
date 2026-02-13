import 'dart:async';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_commande_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_replenishment_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_livraison_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_queue_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_metadata_collection.dart';

void main() {
  late Isar isar;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    final dir = Directory.systemTemp.createTempSync();
    isar = await Isar.open(
      [
        UserCollectionSchema,
        BonCommandeCollectionSchema,
        BonPickingCollectionSchema,
        BonReplenishmentCollectionSchema,
        BonLivraisonCollectionSchema,
        SyncQueueCollectionSchema,
        SyncMetadataCollectionSchema,
      ],
      directory: dir.path,
      name: 'dashboard_test_${DateTime.now().microsecondsSinceEpoch}',
    );
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
  });

  group('Employee Dashboard Data Loading', () {
    test('Should load user data from database', () async {
      // Arrange
      final user = UserCollection.create(
        backendId: 'user-123',
        fullName: 'John Doe',
        email: 'john@example.com',
        role: UserRole.employee,
        status: UserStatus.active,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.userCollections.put(user);
      });

      // Act
      final loadedUser = await isar.userCollections.where().findFirst();

      // Assert
      expect(loadedUser, isNotNull);
      expect(loadedUser!.backendId, equals('user-123'));
      expect(loadedUser.fullName, equals('John Doe'));
      expect(loadedUser.email, equals('john@example.com'));
    });

    test('Should load BonCommande tasks from database', () async {
      // Arrange
      final task1 = BonCommandeCollection.create(
        backendId: 'cmd-001',
        warehouseId: '1',
        employeeId: 'emp-001',
        dailyOperationId: 'op-001',
        totalQuantityExpected: 100,
        status: BonCommandeStatus.pending,
        createdAt: DateTime.now(),
      );

      final task2 = BonCommandeCollection.create(
        backendId: 'cmd-002',
        warehouseId: '1',
        employeeId: 'emp-001',
        dailyOperationId: 'op-001',
        totalQuantityExpected: 50,
        status: BonCommandeStatus.inProgress,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.bonCommandeCollections.putAll([task1, task2]);
      });

      // Act
      final allTasks = await isar.bonCommandeCollections.where().findAll();
      final pendingTasks = await isar.bonCommandeCollections
          .filter()
          .statusEqualTo(BonCommandeStatus.pending)
          .findAll();

      // Assert
      expect(allTasks.length, equals(2));
      expect(pendingTasks.length, equals(1));
      expect(pendingTasks.first.backendId, equals('cmd-001'));
    });

    test('Should load BonPicking tasks from database', () async {
      // Arrange
      final picking = BonPickingCollection.create(
        backendId: 'pick-001',
        warehouseId: '1',
        dailyOperationId: 'op-001',
        employeeId: 'user-123',
        status: BonPickingStatus.pending,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.bonPickingCollections.put(picking);
      });

      // Act
      final loadedPicking = await isar.bonPickingCollections.where().findAll();

      // Assert
      expect(loadedPicking.length, equals(1));
      expect(loadedPicking.first.status, equals(BonPickingStatus.pending));
    });

    test('Should load BonReplenishment tasks from database', () async {
      // Arrange
      final replenishment = BonReplenishmentCollection.create(
        backendId: 'repl-001',
        warehouseId: '1',
        dailyOperationId: 'op-001',
        employeeId: 'user-123',
        status: BonReplenishmentStatus.pending,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.bonReplenishmentCollections.put(replenishment);
      });

      // Act
      final loadedRepl =
          await isar.bonReplenishmentCollections.where().findAll();

      // Assert
      expect(loadedRepl.length, equals(1));
      expect(loadedRepl.first.status, equals(BonReplenishmentStatus.pending));
    });

    test('Should load BonLivraison tasks from database', () async {
      // Arrange
      final livraison = BonLivraisonCollection.create(
        backendId: 'liv-001',
        warehouseId: '1',
        dailyOperationId: 'op-001',
        deliveryId: 'del-001',
        employeeId: 'emp-001',
        status: BonLivraisonStatus.idle,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.bonLivraisonCollections.put(livraison);
      });

      // Act
      final loadedLivraison = await isar.bonLivraisonCollections
          .where()
          .findAll();

      // Assert
      expect(loadedLivraison.length, equals(1));
      expect(loadedLivraison.first.status, equals(BonLivraisonStatus.idle));
    });

    test('Should load sync metadata from database', () async {
      // Arrange
      final metadata = SyncMetadataCollection.create(
        entityType: 'GLOBAL',
        lastPullAt: DateTime.now().subtract(const Duration(minutes: 5)),
      );

      await isar.writeTxn(() async {
        await isar.syncMetadataCollections.put(metadata);
      });

      // Act
      final loadedMeta = await isar.syncMetadataCollections
          .filter()
          .entityTypeEqualTo('GLOBAL')
          .findFirst();

      // Assert
      expect(loadedMeta, isNotNull);
      expect(loadedMeta!.entityType, equals('GLOBAL'));
    });
  });

  group('Task Status Updates', () {
    test('Should update BonCommande status to inProgress', () async {
      // Arrange
      final task = BonCommandeCollection.create(
        backendId: 'cmd-001',
        warehouseId: '1',
        employeeId: 'emp-001',
        dailyOperationId: 'op-001',
        totalQuantityExpected: 100,
        status: BonCommandeStatus.pending,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.bonCommandeCollections.put(task);
      });

      final savedTask = await isar.bonCommandeCollections.where().findFirst();

      // Act
      await isar.writeTxn(() async {
        savedTask!.status = BonCommandeStatus.inProgress;
        savedTask.updatedAt = DateTime.now();
        savedTask.syncStatus = false;
        await isar.bonCommandeCollections.put(savedTask);
      });

      // Assert
      final updatedTask = await isar.bonCommandeCollections.where().findFirst();
      expect(updatedTask!.status, equals(BonCommandeStatus.inProgress));
      expect(updatedTask.syncStatus, isFalse);
    });

    test('Should update BonCommande status to completed', () async {
      // Arrange
      final task = BonCommandeCollection.create(
        backendId: 'cmd-001',
        warehouseId: '1',
        employeeId: 'emp-001',
        dailyOperationId: 'op-001',
        totalQuantityExpected: 100,
        status: BonCommandeStatus.inProgress,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.bonCommandeCollections.put(task);
      });

      final savedTask = await isar.bonCommandeCollections.where().findFirst();

      // Act
      await isar.writeTxn(() async {
        savedTask!.status = BonCommandeStatus.completed;
        savedTask.updatedAt = DateTime.now();
        savedTask.completedAt = DateTime.now();
        savedTask.syncStatus = false;
        await isar.bonCommandeCollections.put(savedTask);
      });

      // Assert
      final updatedTask = await isar.bonCommandeCollections.where().findFirst();
      expect(updatedTask!.status, equals(BonCommandeStatus.completed));
      expect(updatedTask.completedAt, isNotNull);
      expect(updatedTask.syncStatus, isFalse);
    });

    test('Should update BonPicking status to inProgress', () async {
      // Arrange
      final picking = BonPickingCollection.create(
        backendId: 'pick-001',
        warehouseId: '1',
        dailyOperationId: 'op-001',
        employeeId: 'user-123',
        status: BonPickingStatus.pending,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.bonPickingCollections.put(picking);
      });

      final savedPicking = await isar.bonPickingCollections.where().findFirst();

      // Act
      await isar.writeTxn(() async {
        savedPicking!.status = BonPickingStatus.inProgress;
        savedPicking.updatedAt = DateTime.now();
        savedPicking.syncStatus = false;
        await isar.bonPickingCollections.put(savedPicking);
      });

      // Assert
      final updated = await isar.bonPickingCollections.where().findFirst();
      expect(updated!.status, equals(BonPickingStatus.inProgress));
      expect(updated.syncStatus, isFalse);
    });
  });

  group('Sync Queue Operations', () {
    test('Should enqueue sync operation for task update', () async {
      // Arrange
      final queueItem = SyncQueueCollection.create(
        queueId: 'queue-123',
        operationType: SyncOperationType.pushBonCommande,
        dataJson: '{"action": "IN_PROGRESS", "id": "cmd-001"}',
        createdAt: DateTime.now(),
        priority: 8,
      );

      // Act
      await isar.writeTxn(() async {
        await isar.syncQueueCollections.put(queueItem);
      });

      // Assert
      final savedItem = await isar.syncQueueCollections
          .filter()
          .queueIdEqualTo('queue-123')
          .findFirst();
      expect(savedItem, isNotNull);
      expect(savedItem!.priority, equals(8));
      expect(savedItem.status, equals(SyncQueueStatus.pending));
    });

    test('Should enqueue sync operation for completed task', () async {
      // Arrange
      final queueItem = SyncQueueCollection.create(
        queueId: 'queue-456',
        operationType: SyncOperationType.pushBonPicking,
        dataJson: '{"action": "COMPLETED", "id": "pick-001"}',
        createdAt: DateTime.now(),
        priority: 9,
      );

      // Act
      await isar.writeTxn(() async {
        await isar.syncQueueCollections.put(queueItem);
      });

      // Assert
      final savedItem = await isar.syncQueueCollections
          .filter()
          .queueIdEqualTo('queue-456')
          .findFirst();
      expect(savedItem, isNotNull);
      expect(savedItem!.priority, equals(9));
    });

    test('Should enqueue sync operation for task report', () async {
      // Arrange
      final queueItem = SyncQueueCollection.create(
        queueId: 'queue-789',
        operationType: SyncOperationType.pushBonCommande,
        dataJson: '{"action": "REPORT", "id": "cmd-001", "issues": []}',
        createdAt: DateTime.now(),
        priority: 10,
      );

      // Act
      await isar.writeTxn(() async {
        await isar.syncQueueCollections.put(queueItem);
      });

      // Assert
      final savedItem = await isar.syncQueueCollections
          .filter()
          .queueIdEqualTo('queue-789')
          .findFirst();
      expect(savedItem, isNotNull);
      expect(savedItem!.priority, equals(10)); // Report has highest priority
    });
  });

  group('Task Filtering and Sorting', () {
    test('Should filter tasks by status', () async {
      // Arrange
      final tasks = [
        BonCommandeCollection.create(
          backendId: 'cmd-001',
          warehouseId: '1',
          employeeId: 'emp-001',
          dailyOperationId: 'op-001',
          totalQuantityExpected: 100,
          status: BonCommandeStatus.pending,
          createdAt: DateTime.now(),
        ),
        BonCommandeCollection.create(
          backendId: 'cmd-002',
          warehouseId: '1',
          employeeId: 'emp-001',
          dailyOperationId: 'op-001',
          totalQuantityExpected: 50,
          status: BonCommandeStatus.inProgress,
          createdAt: DateTime.now(),
        ),
        BonCommandeCollection.create(
          backendId: 'cmd-003',
          warehouseId: '1',
          employeeId: 'emp-001',
          dailyOperationId: 'op-001',
          totalQuantityExpected: 75,
          status: BonCommandeStatus.completed,
          createdAt: DateTime.now(),
        ),
      ];

      await isar.writeTxn(() async {
        await isar.bonCommandeCollections.putAll(tasks);
      });

      // Act
      final pending = await isar.bonCommandeCollections
          .filter()
          .statusEqualTo(BonCommandeStatus.pending)
          .findAll();

      final inProgress = await isar.bonCommandeCollections
          .filter()
          .statusEqualTo(BonCommandeStatus.inProgress)
          .findAll();

      final completed = await isar.bonCommandeCollections
          .filter()
          .statusEqualTo(BonCommandeStatus.completed)
          .findAll();

      // Assert
      expect(pending.length, equals(1));
      expect(inProgress.length, equals(1));
      expect(completed.length, equals(1));
    });

    test('Should sort tasks by createdAt date', () async {
      // Arrange
      final now = DateTime.now();
      final tasks = [
        BonCommandeCollection.create(
          backendId: 'cmd-003',
          warehouseId: '1',
          employeeId: 'emp-001',
          dailyOperationId: 'op-001',
          totalQuantityExpected: 75,
          status: BonCommandeStatus.pending,
          createdAt: now.subtract(const Duration(hours: 1)),
        ),
        BonCommandeCollection.create(
          backendId: 'cmd-001',
          warehouseId: '1',
          employeeId: 'emp-001',
          dailyOperationId: 'op-001',
          totalQuantityExpected: 100,
          status: BonCommandeStatus.pending,
          createdAt: now.subtract(const Duration(hours: 3)),
        ),
        BonCommandeCollection.create(
          backendId: 'cmd-002',
          warehouseId: '1',
          employeeId: 'emp-001',
          dailyOperationId: 'op-001',
          totalQuantityExpected: 50,
          status: BonCommandeStatus.pending,
          createdAt: now.subtract(const Duration(hours: 2)),
        ),
      ];

      await isar.writeTxn(() async {
        await isar.bonCommandeCollections.putAll(tasks);
      });

      // Act
      final sortedTasks = await isar.bonCommandeCollections
          .where()
          .sortByCreatedAt()
          .findAll();

      // Assert
      expect(sortedTasks.length, equals(3));
      expect(sortedTasks[0].backendId, equals('cmd-001')); // oldest
      expect(sortedTasks[1].backendId, equals('cmd-002'));
      expect(sortedTasks[2].backendId, equals('cmd-003')); // newest
    });
  });

  group('Multi-Task Type Operations', () {
    test('Should load all task types simultaneously', () async {
      // Arrange
      final commande = BonCommandeCollection.create(
        backendId: 'cmd-001',
        warehouseId: '1',
        employeeId: 'emp-001',
        dailyOperationId: 'op-001',
        totalQuantityExpected: 100,
        status: BonCommandeStatus.pending,
        createdAt: DateTime.now(),
      );

      final picking = BonPickingCollection.create(
        backendId: 'pick-001',
        warehouseId: '1',
        dailyOperationId: 'op-001',
        employeeId: 'user-123',
        status: BonPickingStatus.pending,
        createdAt: DateTime.now(),
      );

      final replenishment = BonReplenishmentCollection.create(
        backendId: 'repl-001',
        warehouseId: '1',
        dailyOperationId: 'op-001',
        employeeId: 'user-123',
        status: BonReplenishmentStatus.pending,
        createdAt: DateTime.now(),
      );

      final livraison = BonLivraisonCollection.create(
        backendId: 'liv-001',
        warehouseId: '1',
        dailyOperationId: 'op-001',
        deliveryId: 'del-001',
        employeeId: 'emp-001',
        status: BonLivraisonStatus.idle,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.bonCommandeCollections.put(commande);
        await isar.bonPickingCollections.put(picking);
        await isar.bonReplenishmentCollections.put(replenishment);
        await isar.bonLivraisonCollections.put(livraison);
      });

      // Act
      final allCommandes = await isar.bonCommandeCollections.where().findAll();
      final allPicking = await isar.bonPickingCollections.where().findAll();
      final allRepl = await isar.bonReplenishmentCollections.where().findAll();
      final allLivraison = await isar.bonLivraisonCollections.where().findAll();

      // Assert
      expect(allCommandes.length, equals(1));
      expect(allPicking.length, equals(1));
      expect(allRepl.length, equals(1));
      expect(allLivraison.length, equals(1));
    });
  });
}
