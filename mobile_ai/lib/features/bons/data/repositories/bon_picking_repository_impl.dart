import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_picking_item_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_queue_collection.dart';
import 'package:mobile_ai/core/errors/failures.dart';

abstract class BonPickingRepository {
  Future<Either<Failure, List<BonPickingCollection>>> getAssignedPickings();
  Future<Either<Failure, BonPickingCollection>> getPickingDetails(String id);
  Future<Either<Failure, void>> scanItem(String pickingId, String itemId, int quantity);
  Future<Either<Failure, void>> completePicking(String pickingId);
}

class BonPickingRepositoryImpl implements BonPickingRepository {
  final IsarDatabase db;

  BonPickingRepositoryImpl({required this.db});

  @override
  Future<Either<Failure, List<BonPickingCollection>>> getAssignedPickings() async {
    try {
      final isar = db.isar;
      // In real app, filter by current user
      final pickings = await isar.bonPickingCollections
          .filter()
          .statusEqualTo(BonPickingStatus.pending)
          .or()
          .statusEqualTo(BonPickingStatus.inProgress)
          .findAll();
      
      return Right(pickings);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BonPickingCollection>> getPickingDetails(String id) async {
    try {
      final isar = db.isar;
      
      // Try finding by internal ID first (if int)
      // Since our interface uses String, we likely mean backendId or queueId unless parsed.
      // Assuming 'id' is backendId for this example or Isar internal ID converted to string.
      // Let's assume we pass the backendId usually.
      
      final picking = await isar.bonPickingCollections
          .filter()
          .backendIdEqualTo(id)
          .findFirst();

      if (picking == null) {
        return const Left(NotFoundFailure('Picking task not found'));
      }
      
      return Right(picking);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> scanItem(String pickingId, String itemId, int quantity) async {
    try {
      final isar = db.isar;
      
      return await isar.writeTxn(() async {
        // 1. Find the Item
        final item = await isar.bonPickingItemCollections
            .filter()
            .backendIdEqualTo(itemId)
            .and()
            .bonPickingIdEqualTo(pickingId) // Ensure belongs to correct picking
            .findFirst();

        if (item == null) {
          return const Left(NotFoundFailure('Item not found in this picking list'));
        }

        // 2. Update Local State
        item.picked = true;
        item.quantity = quantity; // Update processed qty if allowed
        item.pickedAt = DateTime.now();
        item.syncStatus = false; // Mark dirty
        
        await isar.bonPickingItemCollections.put(item);

        // 3. Add to Sync Queue
        final queueItem = SyncQueueCollection.create(
          queueId: const Uuid().v4(),
          operationType: SyncOperationType.pushBonPicking, // Or specific item update type
          dataJson: jsonEncode({
            'id': pickingId, // Parent Picking ID
            'item_id': itemId,
            'picked': true,
            'quantity': quantity,
            'picked_at': item.pickedAt!.toIso8601String(),
          }),
          createdAt: DateTime.now(),
        );
        
        await isar.syncQueueCollections.put(queueItem);
        
        // 4. Update Parent Picking Status if needed
        final picking = await isar.bonPickingCollections
             .filter()
             .idEqualTo(int.tryParse(pickingId) ?? 0) // If local ID
             .or()
             .backendIdEqualTo(pickingId)
             .findFirst();
             
        if (picking != null && picking.status == BonPickingStatus.pending) {
          picking.status = BonPickingStatus.inProgress;
          await isar.bonPickingCollections.put(picking);
        }

        return const Right(null);
      });
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> completePicking(String pickingId) async {
    try {
      final isar = db.isar;
      
      return await isar.writeTxn(() async {
        final picking = await isar.bonPickingCollections
            .filter()
            .backendIdEqualTo(pickingId)
            .findFirst();

        if (picking == null) {
          return const Left(NotFoundFailure('Picking task not found'));
        }

        // Validate all items picked? (Business Rule)
        // ...

        picking.status = BonPickingStatus.completed;
        picking.completedAt = DateTime.now();
        picking.syncStatus = false;
        
        await isar.bonPickingCollections.put(picking);

        // Add to Sync Queue
        final queueItem = SyncQueueCollection.create(
          queueId: const Uuid().v4(),
          operationType: SyncOperationType.pushBonPicking,
          dataJson: jsonEncode({
            'id': pickingId,
            'status': 'COMPLETED',
            'completed_at': picking.completedAt!.toIso8601String(),
          }),
          createdAt: DateTime.now(),
        );
        
        await isar.syncQueueCollections.put(queueItem);
        
        return const Right(null);
      });
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
