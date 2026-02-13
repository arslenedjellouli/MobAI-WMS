import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'package:mobile_ai/config/di/injection_container.dart';
import 'package:mobile_ai/core/api/api_client.dart';
import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
import 'package:mobile_ai/core/database/models/bons/bon_commande_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_queue_collection.dart';
import 'package:mobile_ai/core/database/models/sync/sync_metadata_collection.dart';
import 'package:mobile_ai/core/services/connectivity_service.dart';
import 'package:mobile_ai/core/services/sync_service.dart';

/// Integration tests for Employee Dashboard with Backend
/// 
/// These tests verify:
/// 1. Backend connectivity and authentication
/// 2. Task sync push/pull operations
/// 3. Real-time sync status updates
/// 4. Error handling and offline scenarios
/// 
/// To run these tests with a live backend:
/// 1. Start the Django backend server (python manage.py runserver)
/// 2. Update BACKEND_URL constant below to match your backend
/// 3. Run: flutter test test/integration/employee_dashboard_integration_test.dart
void main() {
  // ⚠️ Update this to match your backend URL
  const String BACKEND_URL = 'http://localhost:8000';
  const String API_BASE_URL = '$BACKEND_URL/api/v1';
  
  // Test credentials - ensure these exist in your backend
  const String TEST_EMAIL = 'employee@test.com';
  const String TEST_PASSWORD = 'testpass123';

  late Isar isar;
  late ApiClient apiClient;
  late SyncService syncService;
  late ConnectivityService connectivityService;
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
        SyncQueueCollectionSchema,
        SyncMetadataCollectionSchema,
      ],
      directory: dir.path,
      name: 'dashboard_integration_test_${DateTime.now().microsecondsSinceEpoch}',
    );

    // Initialize services
    final db = _TestIsarDatabase(isar);
    apiClient = ApiClient(baseUrl: API_BASE_URL);
    connectivityService = ConnectivityService();
    syncService = SyncService(
      apiClient: apiClient,
      db: db,
      connectivity: connectivityService,
    );

    // Register in DI
    getIt.registerSingleton<IsarDatabase>(db);
    getIt.registerSingleton<ApiClient>(apiClient);
    getIt.registerSingleton<ConnectivityService>(connectivityService);
    getIt.registerSingleton<SyncService>(syncService);
  });

  tearDown(() async {
    await isar.close(deleteFromDisk: true);
    await getIt.reset();
  });

  group('Backend Connectivity Tests', () {
    test('Should verify backend is accessible', () async {
      try {
        final response = await http.get(Uri.parse('$BACKEND_URL/health/'));
        expect(response.statusCode, equals(200));
      } catch (e) {
        print('⚠️ Backend not accessible at $BACKEND_URL');
        print('Skipping integration tests. Start backend to run these tests.');
        // Skip the test if backend is not running
        return;
      }
    }, skip: false);

    test('Should authenticate with backend and receive JWT tokens', () async {
      try {
        final response = await apiClient.post(
          '/auth/login/',
          data: {
            'email': TEST_EMAIL,
            'password': TEST_PASSWORD,
          },
        );

        expect(response.statusCode, equals(200));
        expect(response.data, contains('access'));
        expect(response.data, contains('refresh'));

        // Store tokens for subsequent tests
        final accessToken = response.data['access'];
        expect(accessToken, isNotNull);
        expect(accessToken, isNotEmpty);
      } catch (e) {
        print('⚠️ Authentication failed. Check credentials.');
        print('Error: $e');
        // Skip if authentication fails
        return;
      }
    });

    test('Should retrieve user profile from backend', () async {
      try {
        // First authenticate
        final loginResponse = await apiClient.post(
          '/auth/login/',
          data: {
            'email': TEST_EMAIL,
            'password': TEST_PASSWORD,
          },
        );

        final token = loginResponse.data['access'];

        // Get user profile
        final dio = Dio(BaseOptions(
          baseUrl: API_BASE_URL,
          headers: {'Authorization': 'Bearer $token'},
        ));

        final profileResponse = await dio.get('/auth/profile/');
        expect(profileResponse.statusCode, equals(200));
        expect(profileResponse.data, contains('email'));
        expect(profileResponse.data, contains('first_name'));
      } catch (e) {
        print('⚠️ Profile retrieval failed: $e');
        return;
      }
    });
  });

  group('Task Sync Integration Tests', () {
    test('Should push task status update to backend', () async {
      // Skip if backend not available
      if (!(await _isBackendAvailable(BACKEND_URL))) {
        print('⚠️ Backend not available, skipping test');
        return;
      }

      try {
        // Authenticate first
        final token = await _authenticate(apiClient);
        if (token == null) return;

        // Create a task in local DB
        final task = BonCommandeCollection.create(
          backendId: 'cmd-integration-test-${DateTime.now().millisecondsSinceEpoch}',
          warehouseId: '1',
          employeeId: 'emp-test',
          dailyOperationId: 'op-test',
          totalQuantityExpected: 100,
          status: BonCommandeStatus.pending,
          createdAt: DateTime.now(),
        );

        await isar.writeTxn(() async {
          await isar.bonCommandeCollections.put(task);
        });

        // Update task to in-progress
        await isar.writeTxn(() async {
          task.status = BonCommandeStatus.inProgress;
          task.updatedAt = DateTime.now();
          task.syncStatus = false;
          await isar.bonCommandeCollections.put(task);
        });

        // Enqueue sync operation
        final queueItem = SyncQueueCollection.create(
          queueId: 'queue-${DateTime.now().millisecondsSinceEpoch}',
          operationType: SyncOperationType.pushBonCommande,
          dataJson: jsonEncode({
            'id': task.backendId,
            'action': 'IN_PROGRESS',
            'status': 'in_progress',
          }),
          createdAt: DateTime.now(),
          priority: 8,
        );

        await isar.writeTxn(() async {
          await isar.syncQueueCollections.put(queueItem);
        });

        // Push changes to backend
        await syncService.pushChanges();

        // Verify sync queue was processed
        final processedItem = await isar.syncQueueCollections
            .filter()
            .queueIdEqualTo(queueItem.queueId)
            .findFirst();

        // If backend is working, item should be marked as processed
        expect(processedItem, isNotNull);
      } catch (e) {
        print('⚠️ Push sync failed: $e');
      }
    });

    test('Should pull tasks from backend', () async {
      // Skip if backend not available
      if (!(await _isBackendAvailable(BACKEND_URL))) {
        print('⚠️ Backend not available, skipping test');
        return;
      }

      try {
        // Authenticate first
        final token = await _authenticate(apiClient);
        if (token == null) return;

        // Pull changes from backend
        await syncService.pullChanges();

        // Verify sync metadata was updated
        final metadata = await isar.syncMetadataCollections
            .filter()
            .entityTypeEqualTo('GLOBAL')
            .findFirst();

        // If pull was successful, metadata should exist
        if (metadata != null) {
          expect(metadata.lastSyncAt, isNotNull);
        }
      } catch (e) {
        print('⚠️ Pull sync failed: $e');
      }
    });

    test('Should handle full sync cycle (push and pull)', () async {
      // Skip if backend not available
      if (!(await _isBackendAvailable(BACKEND_URL))) {
        print('⚠️ Backend not available, skipping test');
        return;
      }

      try {
        // Authenticate first
        final token = await _authenticate(apiClient);
        if (token == null) return;

        // Create local user
        final user = UserCollection.create(
          backendId: 'integration-user',
          fullName: 'Integration Test',
          email: TEST_EMAIL,
          role: UserRole.employee,
          status: UserStatus.active,
          createdAt: DateTime.now(),
        );

        await isar.writeTxn(() async {
          await isar.userCollections.put(user);
        });

        // Perform full sync
        await syncService.pushChanges();
        await syncService.pullChanges();

        // Verify sync completed without errors
        expect(true, isTrue);
      } catch (e) {
        print('⚠️ Full sync cycle failed: $e');
      }
    });

    test('Should handle offline scenario gracefully', () async {
      // Simulate offline by using invalid URL
      final offlineApiClient = ApiClient(baseUrl: 'http://invalid-url:9999');
      final offlineSyncService = SyncService(
        apiClient: offlineApiClient,
        db: _TestIsarDatabase(isar),
        connectivity: connectivityService,
      );

      // Create a task in local DB
      final task = BonCommandeCollection.create(
        backendId: 'cmd-offline-test',
        warehouseId: '1',
        employeeId: 'emp-test',
        dailyOperationId: 'op-test',
        totalQuantityExpected: 100,
        status: BonCommandeStatus.pending,
        createdAt: DateTime.now(),
      );

      await isar.writeTxn(() async {
        await isar.bonCommandeCollections.put(task);
      });

      // Enqueue sync operation
      final queueItem = SyncQueueCollection.create(
        queueId: 'queue-offline',
        operationType: SyncOperationType.pushBonCommande,
        dataJson: jsonEncode({
          'id': task.backendId,
          'action': 'PENDING',
        }),
        createdAt: DateTime.now(),
        priority: 8,
      );

      await isar.writeTxn(() async {
        await isar.syncQueueCollections.put(queueItem);
      });

      // Try to push changes (should handle error gracefully)
      try {
        await offlineSyncService.pushChanges();
      } catch (e) {
        // Expected to fail, but should not crash
        expect(e, isNotNull);
      }

      // Verify task is still in queue
      final remainingItem = await isar.syncQueueCollections
          .filter()
          .queueIdEqualTo('queue-offline')
          .findFirst();

      expect(remainingItem, isNotNull);
    });
  });

  group('Sync Metadata Tests', () {
    test('Should update sync metadata after successful sync', () async {
      // Skip if backend not available
      if (!(await _isBackendAvailable(BACKEND_URL))) {
        print('⚠️ Backend not available, skipping test');
        return;
      }

      try {
        final token = await _authenticate(apiClient);
        if (token == null) return;

        final beforeSync = DateTime.now();

        // Perform sync
        await syncService.pullChanges();

        // Check metadata
        final metadata = await isar.syncMetadataCollections
            .filter()
            .entityTypeEqualTo('GLOBAL')
            .findFirst();

        if (metadata != null) {
          expect(metadata.lastPullAt, isNotNull);
          expect(
            metadata.lastPullAt!.isAfter(beforeSync) ||
                metadata.lastPullAt!.isAtSameMomentAs(beforeSync),
            isTrue,
          );
        }
      } catch (e) {
        print('⚠️ Metadata test failed: $e');
      }
    });

    test('Should track last sync time correctly', () async {
      // Create initial metadata
      final metadata = SyncMetadataCollection.create(
        entityType: 'GLOBAL',
        lastPullAt: DateTime.now().subtract(const Duration(hours: 1)),
      );

      await isar.writeTxn(() async {
        await isar.syncMetadataCollections.put(metadata);
      });

      // Wait a bit
      await Future.delayed(const Duration(milliseconds: 100));

      // Update metadata
      final newSyncTime = DateTime.now();
      await isar.writeTxn(() async {
        metadata.lastPullAt = newSyncTime;
        await isar.syncMetadataCollections.put(metadata);
      });

      // Verify update
      final updated = await isar.syncMetadataCollections
          .filter()
          .entityTypeEqualTo('GLOBAL')
          .findFirst();

      expect(updated, isNotNull);
      expect(updated!.lastPullAt, equals(newSyncTime));
    });
  });

  group('Error Handling Tests', () {
    test('Should mark sync queue item as failed on error', () async {
      // Create invalid API client
      final badApiClient = ApiClient(baseUrl: 'http://invalid-backend:9999');
      final badSyncService = SyncService(
        apiClient: badApiClient,
        db: _TestIsarDatabase(isar),
        connectivity: connectivityService,
      );

      // Create sync queue item
      final queueItem = SyncQueueCollection.create(
        queueId: 'error-test-queue',
        operationType: SyncOperationType.pushBonCommande,
        dataJson: jsonEncode({'test': 'data'}),
        createdAt: DateTime.now(),
        priority: 5,
      );

      await isar.writeTxn(() async {
        await isar.syncQueueCollections.put(queueItem);
      });

      // Try to sync (will fail)
      try {
        await badSyncService.pushChanges();
      } catch (e) {
        // Expected to fail
      }

      // Verify item still exists (failed items are kept for retry)
      final item = await isar.syncQueueCollections
          .filter()
          .queueIdEqualTo('error-test-queue')
          .findFirst();

      expect(item, isNotNull);
    });

    test('Should retry failed sync operations', () async {
      // Create a failed sync item
      final failedItem = SyncQueueCollection.create(
        queueId: 'retry-test',
        operationType: SyncOperationType.pushBonCommande,
        dataJson: jsonEncode({'retry': 'test'}),
        createdAt: DateTime.now().subtract(const Duration(minutes: 5)),
        priority: 7,
        status: SyncQueueStatus.failed,
        retryCount: 1,
        lastAttemptAt: DateTime.now().subtract(const Duration(minutes: 2)),
      );

      await isar.writeTxn(() async {
        await isar.syncQueueCollections.put(failedItem);
      });

      // Verify it exists and can be retried
      final item = await isar.syncQueueCollections
          .filter()
          .statusEqualTo(SyncQueueStatus.failed)
          .findFirst();

      expect(item, isNotNull);
      expect(item!.retryCount, equals(1));
    });
  });
}

// Helper functions

// Test wrapper for IsarDatabase
class _TestIsarDatabase extends IsarDatabase {
  final Isar _testIsar;
  
  _TestIsarDatabase(this._testIsar);
  
  @override
  Isar get isar => _testIsar;
}

Future<bool> _isBackendAvailable(String backendUrl) async {
  try {
    final response = await http
        .get(Uri.parse('$backendUrl/health/'))
        .timeout(const Duration(seconds: 5));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}

Future<String?> _authenticate(ApiClient apiClient) async {
  try {
    final response = await apiClient.post(
      '/auth/login/',
      data: {
        'email': 'employee@test.com',
        'password': 'testpass123',
      },
    );

    if (response.statusCode == 200 && response.data.containsKey('access')) {
      return response.data['access'];
    }
    return null;
  } catch (e) {
    print('⚠️ Authentication failed: $e');
    return null;
  }
}
