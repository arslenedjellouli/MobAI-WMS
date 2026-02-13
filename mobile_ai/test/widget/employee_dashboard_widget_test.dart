import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:mockito/mockito.dart';

import 'package:mobile_ai/config/di/injection_container.dart';
import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_commande_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_replenishment_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_livraison_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_queue_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_metadata_collection.dart';
import 'package:mobile_ai/core/services/connectivity_service.dart';
import 'package:mobile_ai/core/services/sync_service.dart';
import 'package:mobile_ai/features/dashboard/presentation/pages/employee_dashboard_page.dart';

// Mock services
class MockSyncService extends Mock implements SyncService {}

class MockConnectivityService extends Mock implements ConnectivityService {
  final _controller = StreamController<NetworkStatus>.broadcast();

  @override
  Stream<NetworkStatus> get networkStatusStream => _controller.stream;

  void emitStatus(NetworkStatus status) {
    _controller.add(status);
  }

  @override
  void dispose() {
    _controller.close();
  }
}

// Test wrapper for IsarDatabase
class _TestIsarDatabase extends IsarDatabase {
  final Isar _testIsar;
  
  _TestIsarDatabase(this._testIsar);
  
  @override
  Isar get isar => _testIsar;
}

void main() {
  late Isar isar;
  late MockSyncService mockSyncService;
  late MockConnectivityService mockConnectivityService;
  final GetIt getIt = GetIt.instance;

  setUpAll(() async {
    await Isar.initializeIsarCore(download: true);
  });

  setUp(() async {
    // Reset GetIt
    await getIt.reset();

    // Create test database
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
      name: 'dashboard_widget_test_${DateTime.now().microsecondsSinceEpoch}',
    );

    // Create mocks
    mockSyncService = MockSyncService();
    mockConnectivityService = MockConnectivityService();

    // Create a wrapper for IsarDatabase that directly exposes our test isar instance
    final mockDb = _TestIsarDatabase(isar);
    
    // Register in DI
    getIt.registerSingleton<IsarDatabase>(mockDb);
    getIt.registerSingleton<SyncService>(mockSyncService);
    getIt.registerSingleton<ConnectivityService>(mockConnectivityService);
    
    // Set default mock behaviors
    when(mockSyncService.pushChanges()).thenAnswer((_) async {});
    when(mockSyncService.pullChanges()).thenAnswer((_) async {});
    when(mockConnectivityService.isOnline).thenReturn(true);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
    await getIt.reset();
    mockConnectivityService.dispose();
  });

  Widget makeTestableWidget(Widget child) {
    return MaterialApp(
      home: child,
    );
  }

  group('Employee Dashboard Widget Tests', () {
    testWidgets('Should display loading indicator initially',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      
      // Assert
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Should display employee name and ID after loading',
        (WidgetTester tester) async {
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
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Hello John Doe,'), findsOneWidget);
      expect(find.textContaining('Employee #'), findsOneWidget);
    });

    testWidgets('Should display online status indicator',
        (WidgetTester tester) async {
      // Arrange
      when(mockConnectivityService.isOnline).thenReturn(true);

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Online'), findsOneWidget);
    });

    testWidgets('Should display offline status indicator',
        (WidgetTester tester) async {
      // Arrange
      when(mockConnectivityService.isOnline).thenReturn(false);

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Offline'), findsOneWidget);
    });

    testWidgets('Should display three tabs (Tasks, Completed, Remaining)',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Tasks'), findsOneWidget);
      expect(find.text('Completed'), findsOneWidget);
      expect(find.text('Remaining'), findsOneWidget);
    });

    testWidgets('Should display task card when tasks exist',
        (WidgetTester tester) async {
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

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Assert
      expect(find.textContaining('RC'), findsWidgets); // Receipt code prefix
    });

    testWidgets('Should switch tabs when tapped',
        (WidgetTester tester) async {
      // Arrange
      final completedTask = BonCommandeCollection.create(
        backendId: 'cmd-001',
        warehouseId: '1',
        employeeId: 'emp-001',
        dailyOperationId: 'op-001',
        totalQuantityExpected: 100,
        status: BonCommandeStatus.completed,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.bonCommandeCollections.put(completedTask);
      });

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Tap on Completed tab
      await tester.tap(find.text('Completed'));
      await tester.pumpAndSettle();

      // Assert - completed tab should be selected
      // The tab container should have white background when active
      expect(find.text('Completed'), findsOneWidget);
    });

    testWidgets('Should display sync button in header',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Assert
      expect(find.byIcon(Icons.sync), findsOneWidget);
    });

    testWidgets('Should trigger sync when sync button is tapped',
        (WidgetTester tester) async {
      // Arrange
      when(mockConnectivityService.isOnline).thenReturn(true);
      when(mockSyncService.pushChanges()).thenAnswer((_) async {});
      when(mockSyncService.pullChanges()).thenAnswer((_) async {});

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Tap sync button
      await tester.tap(find.byIcon(Icons.sync));
      await tester.pumpAndSettle();

      // Assert
      verify(mockSyncService.pushChanges()).called(greaterThanOrEqualTo(1));
      verify(mockSyncService.pullChanges()).called(greaterThanOrEqualTo(1));
    });

    testWidgets('Should not enable sync button when offline',
        (WidgetTester tester) async {
      // Arrange
      when(mockConnectivityService.isOnline).thenReturn(false);

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Find the sync button
      final syncButton = find.byIcon(Icons.sync);
      expect(syncButton, findsOneWidget);

      // The button should be disabled (onPressed is null)
      final iconButton = tester.widget<IconButton>(syncButton);
      expect(iconButton.onPressed, isNull);
    });

    testWidgets('Should support pull to refresh',
        (WidgetTester tester) async {
      // Arrange
      when(mockConnectivityService.isOnline).thenReturn(true);
      when(mockSyncService.pushChanges()).thenAnswer((_) async {});
      when(mockSyncService.pullChanges()).thenAnswer((_) async {});

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Perform pull-to-refresh gesture
      await tester.drag(
        find.byType(RefreshIndicator),
        const Offset(0, 300),
      );
      await tester.pumpAndSettle();

      // Assert
      verify(mockSyncService.pushChanges()).called(greaterThanOrEqualTo(1));
      verify(mockSyncService.pullChanges()).called(greaterThanOrEqualTo(1));
    });

    testWidgets('Should display "CURRENT TASK" section when task exists',
        (WidgetTester tester) async {
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

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('CURRENT TASK'), findsOneWidget);
    });

    testWidgets('Should display different task types with correct prefixes',
        (WidgetTester tester) async {
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

      await isar.writeTxn(() async {
        await isar.bonCommandeCollections.put(commande);
        await isar.bonPickingCollections.put(picking);
      });

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Switch to Remaining tab to see all tasks
      await tester.tap(find.text('Remaining'));
      await tester.pumpAndSettle();

      // Assert - should show both prefixes
      expect(find.textContaining('RC'), findsWidgets); // Receipt
      expect(find.textContaining('PK'), findsWidgets); // Picking
    });

    testWidgets('Should display empty state when no tasks',
        (WidgetTester tester) async {
      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Assert - should show "No tasks" or similar empty state
      expect(find.text('No tasks available'), findsOneWidget);
    });

    testWidgets('Should update network status when connectivity changes',
        (WidgetTester tester) async {
      // Arrange
      when(mockConnectivityService.isOnline).thenReturn(true);

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      expect(find.text('Online'), findsOneWidget);

      // Change network status
      when(mockConnectivityService.isOnline).thenReturn(false);
      mockConnectivityService.emitStatus(NetworkStatus.offline);

      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Offline'), findsOneWidget);
    });
  });

  group('Task Interaction Tests', () {
    testWidgets('Should show task action buttons on current task',
        (WidgetTester tester) async {
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

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Assert - should find action buttons
      expect(find.text('Start Task'), findsOneWidget);
    });

    testWidgets('Should mark task as in progress when Start Task is tapped',
        (WidgetTester tester) async {
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

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Tap Start Task button
      await tester.tap(find.text('Start Task'));
      await tester.pumpAndSettle();

      // Assert - verify task status updated
      final updatedTask =
          await isar.bonCommandeCollections.where().findFirst();
      expect(updatedTask!.status, equals(BonCommandeStatus.inProgress));
      expect(updatedTask.syncStatus, isFalse);

      // Verify sync queue item was created
      final queueItems = await isar.syncQueueCollections.where().findAll();
      expect(queueItems.isNotEmpty, isTrue);
    });

    testWidgets('Should mark task as completed when Complete Task is tapped',
        (WidgetTester tester) async {
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

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Tap Complete Task button
      await tester.tap(find.text('Complete Task'));
      await tester.pumpAndSettle();

      // Assert - verify task status updated
      final updatedTask =
          await isar.bonCommandeCollections.where().findFirst();
      expect(updatedTask!.status, equals(BonCommandeStatus.completed));
      expect(updatedTask.completedAt, isNotNull);
      expect(updatedTask.syncStatus, isFalse);
    });

    testWidgets('Should show report dialog when Report Issue is tapped',
        (WidgetTester tester) async {
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

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Tap Report Issue button
      await tester.tap(find.text('Report Issue'));
      await tester.pumpAndSettle();

      // Assert - should show bottom sheet with issue options
      expect(find.text('Report an Issue'), findsOneWidget);
    });

    testWidgets('Should enqueue report when issue is submitted',
        (WidgetTester tester) async {
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

      // Act
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Tap Report Issue
      await tester.tap(find.text('Report Issue'));
      await tester.pumpAndSettle();

      // Select an issue (tap checkbox)
      await tester.tap(find.byType(Checkbox).first);
      await tester.pumpAndSettle();

      // Submit report
      await tester.tap(find.text('Submit Report'));
      await tester.pumpAndSettle();

      // Assert - verify sync queue item was created with priority 10
      final queueItems = await isar.syncQueueCollections
          .filter()
          .priorityEqualTo(10)
          .findAll();
      expect(queueItems.isNotEmpty, isTrue);
    });
  });

  group('Task Count Display Tests', () {
    testWidgets('Should display correct task counts in tabs',
        (WidgetTester tester) async {
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
          status: BonCommandeStatus.completed,
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
      await tester.pumpWidget(makeTestableWidget(const EmployeeDashboardPage()));
      await tester.pumpAndSettle();

      // Assert - should show counts in tabs
      expect(find.textContaining('3'), findsWidgets); // Total tasks
      expect(find.textContaining('2'), findsWidgets); // Completed
    });
  });
}
