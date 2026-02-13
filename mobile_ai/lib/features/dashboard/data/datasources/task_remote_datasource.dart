import 'dart:developer' as developer;

import 'package:dio/dio.dart';

import '../../../../core/api/api_client.dart';

abstract class TaskRemoteDataSource {
  Future<List<Map<String, dynamic>>> getTasks({
    String? status,
    String? assignedTo,
    String? taskType,
  });

  Future<Map<String, dynamic>> getTasksByStatus(String userId);

  Future<List<Map<String, dynamic>>> getTasksForUser(String userId);

  Future<Map<String, dynamic>> getTaskDetails(String taskId);

  Future<Map<String, dynamic>> startTask(String taskId);

  Future<Map<String, dynamic>> completeTask(String taskId);

  Future<Map<String, dynamic>> updateTaskProgress(
      String taskId, int itemsCompleted);

  Future<Map<String, dynamic>> updateTaskStatus(
      String taskId, String newStatus);

  Future<Map<String, dynamic>> getDashboardSummary(String userId);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final ApiClient apiClient;

  TaskRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<List<Map<String, dynamic>>> getTasks({
    String? status,
    String? assignedTo,
    String? taskType,
  }) async {
    try {
      developer.log('📥 Fetching tasks from API', name: 'TaskRemoteDataSource');

      final queryParams = <String, dynamic>{};
      if (status != null) queryParams['status'] = status;
      if (assignedTo != null) queryParams['assigned_to'] = assignedTo;
      if (taskType != null) queryParams['task_type'] = taskType;

      final response = await apiClient.get(
        '/operations/tasks/',
        queryParameters: queryParams,
      );

      developer.log('✅ Tasks fetched successfully', name: 'TaskRemoteDataSource');

      if (response.data is Map) {
        final results = response.data['results'] as List? ?? [];
        return List<Map<String, dynamic>>.from(results);
      }

      return List<Map<String, dynamic>>.from(response.data ?? []);
    } on DioException catch (e) {
      developer.log(
        '❌ Error fetching tasks: ${e.message}',
        name: 'TaskRemoteDataSource',
        error: e,
      );
      rethrow;
    } catch (e) {
      developer.log(
        '❌ Unknown error fetching tasks: $e',
        name: 'TaskRemoteDataSource',
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getTasksByStatus(String userId) async {
    try {
      developer.log('📥 Fetching tasks by status for user: $userId',
          name: 'TaskRemoteDataSource');

      final response = await apiClient.get(
        '/operations/tasks/by-status/',
        queryParameters: {'user_id': userId},
      );

      developer.log('✅ Tasks by status fetched successfully',
          name: 'TaskRemoteDataSource');

      return Map<String, dynamic>.from(response.data ?? {});
    } on DioException catch (e) {
      developer.log(
        '❌ Error fetching tasks by status: ${e.message}',
        name: 'TaskRemoteDataSource',
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getTasksForUser(String userId) async {
    try {
      developer.log(
        '📥 Fetching tasks for user: $userId',
        name: 'TaskRemoteDataSource',
      );

      final response = await apiClient.get(
        '/operations/tasks/',
        queryParameters: {'assigned_to': userId},
      );

      developer.log('✅ User tasks fetched successfully',
          name: 'TaskRemoteDataSource');

      if (response.data is Map) {
        final results = response.data['results'] as List? ?? [];
        return List<Map<String, dynamic>>.from(results);
      }

      return List<Map<String, dynamic>>.from(response.data ?? []);
    } on DioException catch (e) {
      developer.log(
        '❌ Error fetching user tasks: ${e.message}',
        name: 'TaskRemoteDataSource',
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getTaskDetails(String taskId) async {
    try {
      developer.log('📥 Fetching task details: $taskId',
          name: 'TaskRemoteDataSource');

      final response = await apiClient.get('/operations/tasks/$taskId/');

      developer.log('✅ Task details fetched successfully',
          name: 'TaskRemoteDataSource');

      return Map<String, dynamic>.from(response.data ?? {});
    } on DioException catch (e) {
      developer.log(
        '❌ Error fetching task details: ${e.message}',
        name: 'TaskRemoteDataSource',
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> startTask(String taskId) async {
    try {
      developer.log('🚀 Starting task: $taskId', name: 'TaskRemoteDataSource');

      final response = await apiClient.post(
        '/operations/tasks/$taskId/start/',
      );

      developer.log('✅ Task started successfully', name: 'TaskRemoteDataSource');

      return Map<String, dynamic>.from(response.data ?? {});
    } on DioException catch (e) {
      developer.log(
        '❌ Error starting task: ${e.message}',
        name: 'TaskRemoteDataSource',
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> completeTask(String taskId) async {
    try {
      developer.log('✓ Completing task: $taskId', name: 'TaskRemoteDataSource');

      final response = await apiClient.post(
        '/operations/tasks/$taskId/complete/',
      );

      developer.log('✅ Task completed successfully',
          name: 'TaskRemoteDataSource');

      return Map<String, dynamic>.from(response.data ?? {});
    } on DioException catch (e) {
      developer.log(
        '❌ Error completing task: ${e.message}',
        name: 'TaskRemoteDataSource',
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateTaskProgress(
      String taskId, int itemsCompleted) async {
    try {
      developer.log(
        '📊 Updating task progress: $taskId -> $itemsCompleted items',
        name: 'TaskRemoteDataSource',
      );

      final response = await apiClient.patch(
        '/operations/tasks/$taskId/update-status/',
        data: {'items_completed': itemsCompleted},
      );

      developer.log('✅ Task progress updated successfully',
          name: 'TaskRemoteDataSource');

      return Map<String, dynamic>.from(response.data ?? {});
    } on DioException catch (e) {
      developer.log(
        '❌ Error updating task progress: ${e.message}',
        name: 'TaskRemoteDataSource',
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateTaskStatus(
      String taskId, String newStatus) async {
    try {
      developer.log(
        '🔄 Updating task status: $taskId -> $newStatus',
        name: 'TaskRemoteDataSource',
      );

      final response = await apiClient.patch(
        '/operations/tasks/$taskId/update-status/',
        data: {'status': newStatus},
      );

      developer.log('✅ Task status updated successfully',
          name: 'TaskRemoteDataSource');

      return Map<String, dynamic>.from(response.data ?? {});
    } on DioException catch (e) {
      developer.log(
        '❌ Error updating task status: ${e.message}',
        name: 'TaskRemoteDataSource',
        error: e,
      );
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getDashboardSummary(String userId) async {
    try {
      developer.log(
        '📊 Fetching dashboard summary for user: $userId',
        name: 'TaskRemoteDataSource',
      );

      final response = await apiClient.get(
        '/operations/tasks/dashboard/',
        queryParameters: {'user_id': userId},
      );

      developer.log('✅ Dashboard summary fetched successfully',
          name: 'TaskRemoteDataSource');

      return Map<String, dynamic>.from(response.data ?? {});
    } on DioException catch (e) {
      developer.log(
        '❌ Error fetching dashboard summary: ${e.message}',
        name: 'TaskRemoteDataSource',
        error: e,
      );
      rethrow;
    }
  }
}
