import 'dart:developer' as developer;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/services/connectivity_service.dart';
import '../../domain/entities/employee_task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_local_datasource.dart';
import '../datasources/task_remote_datasource.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskRemoteDataSource remoteDataSource;
  final TaskLocalDataSource localDataSource;
  final ConnectivityService connectivityService;

  TaskRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.connectivityService,
  });

  @override
  Future<Either<Failure, List<EmployeeTask>>> getTasksForUser(
      String userId) async {
    developer.log('🔄 Getting tasks for user: $userId',
        name: 'TaskRepository');

    try {
      final isOnline = connectivityService.isOnline;

      if (isOnline) {
        try {
          final remoteTasks = await remoteDataSource.getTasksForUser(userId);
          final tasks = remoteTasks
              .map((data) => _mapDataToTask(data))
              .toList();

          // Save to local DB
          await localDataSource.saveTasks(tasks);

          developer.log('✅ Tasks fetched from remote and cached locally',
              name: 'TaskRepository');

          return Right(tasks);
        } on DioException catch (e) {
          developer.log('⚠️ Remote fetch failed, using local cache',
              name: 'TaskRepository');

          // Fall back to local cache
          final localTasks = await localDataSource.getTasksForUser(userId);
          if (localTasks.isNotEmpty) {
            return Right(localTasks);
          }

          return Left(NetworkFailure(
            message: 'Network error: ${e.message}',
          ));
        }
      } else {
        // Offline - use local cache
        developer.log('📴 Offline mode - using local cache',
            name: 'TaskRepository');

        final localTasks = await localDataSource.getTasksForUser(userId);
        return Right(localTasks);
      }
    } catch (e) {
      developer.log('❌ Error getting tasks: $e', name: 'TaskRepository',
          error: e);

      return Left(UnknownFailure(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, Map<String, List<EmployeeTask>>>>
      getTasksByStatus(String userId) async {
    developer.log('🔄 Getting tasks by status for user: $userId',
        name: 'TaskRepository');

    try {
      final isOnline = connectivityService.isOnline;

      if (isOnline) {
        try {
          final remoteData =
              await remoteDataSource.getTasksByStatus(userId);

          final pending = (remoteData['pending'] as List? ?? [])
              .map((data) => _mapDataToTask(data))
              .toList();
          final inProgress = (remoteData['in_progress'] as List? ?? [])
              .map((data) => _mapDataToTask(data))
              .toList();
          final completed = (remoteData['completed'] as List? ?? [])
              .map((data) => _mapDataToTask(data))
              .toList();

          // Save all tasks to local DB
          await localDataSource
              .saveTasks([...pending, ...inProgress, ...completed]);

          developer.log('✅ Tasks by status fetched and cached',
              name: 'TaskRepository');

          return Right({
            'pending': pending,
            'in_progress': inProgress,
            'completed': completed,
          });
        } on DioException catch (e) {
          // Fall back to local cache
          final localData = await localDataSource.getTasksByStatus(userId);
          if (localData.values.any((list) => list.isNotEmpty)) {
            return Right(localData);
          }

          return Left(NetworkFailure(message: 'Network error: ${e.message}'));
        }
      } else {
        // Offline - use local cache
        final localData = await localDataSource.getTasksByStatus(userId);
        return Right(localData);
      }
    } catch (e) {
      developer.log('❌ Error getting tasks by status: $e',
          name: 'TaskRepository', error: e);

      return Left(UnknownFailure(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, EmployeeTask?>> getCurrentTask(String userId) async {
    developer.log('🔄 Getting current task for user: $userId',
        name: 'TaskRepository');

    try {
      final isOnline = connectivityService.isOnline;

      if (isOnline) {
        try {
          final remoteData =
              await remoteDataSource.getDashboardSummary(userId);

          final currentTaskData = remoteData['current_task'];
          if (currentTaskData != null) {
            final task = _mapDataToTask(currentTaskData);
            await localDataSource.saveTask(task);

            developer.log('✅ Current task fetched and cached',
                name: 'TaskRepository');

            return Right(task);
          }

          return const Right(null);
        } on DioException catch (e) {
          // Fall back to local cache
          final localTask = await localDataSource.getCurrentTask(userId);
          return Right(localTask);
        }
      } else {
        // Offline - use local cache
        final localTask = await localDataSource.getCurrentTask(userId);
        return Right(localTask);
      }
    } catch (e) {
      developer.log('❌ Error getting current task: $e',
          name: 'TaskRepository', error: e);

      return Left(UnknownFailure(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, EmployeeTask>> startTask(String taskId) async {
    developer.log('🚀 Starting task: $taskId', name: 'TaskRepository');

    try {
      final isOnline = connectivityService.isOnline;

      if (!isOnline) {
        return Left(NetworkFailure(message: 'No internet connection'));
      }

      final remoteData = await remoteDataSource.startTask(taskId);
      final task = _mapDataToTask(remoteData);

      // Update local cache
      await localDataSource.saveTask(task);

      developer.log('✅ Task started successfully', name: 'TaskRepository');

      return Right(task);
    } on DioException catch (e) {
      return Left(NetworkFailure(message: 'Network error: ${e.message}'));
    } catch (e) {
      return Left(UnknownFailure(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, EmployeeTask>> completeTask(String taskId) async {
    developer.log('✓ Completing task: $taskId', name: 'TaskRepository');

    try {
      final isOnline = connectivityService.isOnline;

      if (!isOnline) {
        return Left(NetworkFailure(message: 'No internet connection'));
      }

      final remoteData = await remoteDataSource.completeTask(taskId);
      final task = _mapDataToTask(remoteData);

      // Update local cache
      await localDataSource.saveTask(task);

      developer.log('✅ Task completed successfully', name: 'TaskRepository');

      return Right(task);
    } on DioException catch (e) {
      return Left(NetworkFailure(message: 'Network error: ${e.message}'));
    } catch (e) {
      return Left(UnknownFailure(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, EmployeeTask>> updateTaskProgress(
      String taskId, int itemsCompleted) async {
    developer.log(
      '📊 Updating task progress: $taskId -> $itemsCompleted',
      name: 'TaskRepository',
    );

    try {
      final isOnline = connectivityService.isOnline;

      if (!isOnline) {
        // Update local cache only
        await localDataSource.updateTaskProgress(taskId, itemsCompleted);
        final localTask = await localDataSource.getTaskById(taskId);
        return Right(localTask!);
      }

      final remoteData =
          await remoteDataSource.updateTaskProgress(taskId, itemsCompleted);
      final task = _mapDataToTask(remoteData);

      // Update local cache
      await localDataSource.saveTask(task);

      developer.log('✅ Task progress updated successfully',
          name: 'TaskRepository');

      return Right(task);
    } on DioException catch (e) {
      return Left(NetworkFailure(message: 'Network error: ${e.message}'));
    } catch (e) {
      return Left(UnknownFailure(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, EmployeeTask>> updateTaskStatus(
      String taskId, TaskStatus newStatus) async {
    developer.log(
      '🔄 Updating task status: $taskId -> ${newStatus.name}',
      name: 'TaskRepository',
    );

    try {
      final isOnline = connectivityService.isOnline;

      if (!isOnline) {
        // Update local cache only
        await localDataSource.updateTaskStatus(taskId, newStatus);
        final localTask = await localDataSource.getTaskById(taskId);
        return Right(localTask!);
      }

      final statusString = _taskStatusToString(newStatus);
      final remoteData =
          await remoteDataSource.updateTaskStatus(taskId, statusString);
      final task = _mapDataToTask(remoteData);

      // Update local cache
      await localDataSource.saveTask(task);

      developer.log('✅ Task status updated successfully',
          name: 'TaskRepository');

      return Right(task);
    } on DioException catch (e) {
      return Left(NetworkFailure(message: 'Network error: ${e.message}'));
    } catch (e) {
      return Left(UnknownFailure(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, EmployeeTask>> getTaskDetails(String taskId) async {
    developer.log('🔄 Getting task details: $taskId',
        name: 'TaskRepository');

    try {
      final isOnline = connectivityService.isOnline;

      if (isOnline) {
        try {
          final remoteData =
              await remoteDataSource.getTaskDetails(taskId);
          final task = _mapDataToTask(remoteData);

          await localDataSource.saveTask(task);

          return Right(task);
        } on DioException catch (e) {
          // Fall back to local cache
          final localTask = await localDataSource.getTaskById(taskId);
          if (localTask != null) {
            return Right(localTask);
          }

          return Left(NetworkFailure(message: 'Network error: ${e.message}'));
        }
      } else {
        final localTask = await localDataSource.getTaskById(taskId);
        if (localTask != null) {
          return Right(localTask);
        }

        return Left(
          NetworkFailure(message: 'No internet and task not in local cache'),
        );
      }
    } catch (e) {
      return Left(UnknownFailure(message: 'Error: $e'));
    }
  }

  @override
  Future<Either<Failure, DashboardTaskSummary>> getDashboardSummary(
      String userId) async {
    developer.log('📊 Getting dashboard summary for user: $userId',
        name: 'TaskRepository');

    try {
      final isOnline = connectivityService.isOnline;

      if (isOnline) {
        try {
          final remoteData =
              await remoteDataSource.getDashboardSummary(userId);

          final currentTaskData = remoteData['current_task'];
          final currentTask = currentTaskData != null
              ? _mapDataToTask(currentTaskData)
              : null;

          final remainingList = (remoteData['remaining_tasks'] as List? ?? [])
              .map((data) => _mapDataToTask(data))
              .toList();

          final completedList = (remoteData['completed_tasks'] as List? ?? [])
              .map((data) => _mapDataToTask(data))
              .toList();

          // Save all tasks to local DB
          final allTasks = [
            if (currentTask != null) currentTask,
            ...remainingList,
            ...completedList,
          ];
          await localDataSource.saveTasks(allTasks);

          final summary = DashboardTaskSummary(
            currentTask: currentTask,
            remainingTasks: remainingList,
            completedTasks: completedList,
            totalTasks: remoteData['total_tasks'] ?? 0,
          );

          developer.log('✅ Dashboard summary fetched and cached',
              name: 'TaskRepository');

          return Right(summary);
        } on DioException catch (e) {
          // Fall back to local cache
          final byStatus = await localDataSource.getTasksByStatus(userId);
          final currentTask =
              await localDataSource.getCurrentTask(userId);

          final summary = DashboardTaskSummary(
            currentTask: currentTask,
            remainingTasks: byStatus['pending'] ?? [],
            completedTasks: byStatus['completed'] ?? [],
            totalTasks: (byStatus['pending']?.length ?? 0) +
                (byStatus['in_progress']?.length ?? 0) +
                (byStatus['completed']?.length ?? 0),
          );

          return Right(summary);
        }
      } else {
        // Offline - use local cache
        final byStatus = await localDataSource.getTasksByStatus(userId);
        final currentTask = await localDataSource.getCurrentTask(userId);

        final summary = DashboardTaskSummary(
          currentTask: currentTask,
          remainingTasks: byStatus['pending'] ?? [],
          completedTasks: byStatus['completed'] ?? [],
          totalTasks: (byStatus['pending']?.length ?? 0) +
              (byStatus['in_progress']?.length ?? 0) +
              (byStatus['completed']?.length ?? 0),
        );

        return Right(summary);
      }
    } catch (e) {
      return Left(UnknownFailure(message: 'Error: $e'));
    }
  }

  // Helper methods

  EmployeeTask _mapDataToTask(Map<String, dynamic> data) {
    return EmployeeTask(
      id: data['id']?.toString() ?? '',
      title: data['title'] ?? '',
      description: data['description'],
      taskType: _stringToTaskType(data['task_type'] ?? ''),
      status: _stringToTaskStatus(data['status'] ?? ''),
      assignedToUserId: data['assigned_to']?.toString() ?? '',
      assignedByUserId: data['assigned_by']?.toString(),
      warehouseId: data['warehouse']?.toString() ?? '',
      dailyOperationId: data['daily_operation']?.toString(),
      priority: data['priority'] ?? 0,
      dueDate: data['due_date'] != null
          ? DateTime.tryParse(data['due_date'])
          : null,
      startedAt: data['started_at'] != null
          ? DateTime.tryParse(data['started_at'])
          : null,
      completedAt: data['completed_at'] != null
          ? DateTime.tryParse(data['completed_at'])
          : null,
      itemsCount: data['items_count'] ?? 0,
      itemsCompleted: data['items_completed'] ?? 0,
      estimatedDurationMinutes: data['estimated_duration_minutes'],
      notes: data['notes'],
      bonReferenceType: data['bon_reference_type'],
      bonReferenceId: data['bon_reference_id'],
      createdAt: DateTime.tryParse(data['created_at'] ?? '') ??
          DateTime.now(),
      updatedAt: data['updated_at'] != null
          ? DateTime.tryParse(data['updated_at'])
          : null,
    );
  }

  TaskType _stringToTaskType(String type) {
    switch (type.toUpperCase()) {
      case 'RECEIPT':
        return TaskType.receipt;
      case 'PICKING':
        return TaskType.picking;
      case 'PREPARATION':
        return TaskType.preparation;
      case 'REPLENISHMENT':
        return TaskType.replenishment;
      case 'DELIVERY':
        return TaskType.delivery;
      case 'STORAGE':
        return TaskType.storage;
      default:
        return TaskType.picking;
    }
  }

  TaskStatus _stringToTaskStatus(String status) {
    switch (status.toUpperCase()) {
      case 'PENDING':
        return TaskStatus.pending;
      case 'IN_PROGRESS':
        return TaskStatus.inProgress;
      case 'COMPLETED':
        return TaskStatus.completed;
      case 'CANCELLED':
        return TaskStatus.cancelled;
      default:
        return TaskStatus.pending;
    }
  }

  String _taskStatusToString(TaskStatus status) {
    switch (status) {
      case TaskStatus.pending:
        return 'PENDING';
      case TaskStatus.inProgress:
        return 'IN_PROGRESS';
      case TaskStatus.completed:
        return 'COMPLETED';
      case TaskStatus.cancelled:
        return 'CANCELLED';
    }
  }
}
