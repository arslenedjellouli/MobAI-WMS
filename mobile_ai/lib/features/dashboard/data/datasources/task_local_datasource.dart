import 'dart:developer' as developer;

import 'package:isar/isar.dart';
import 'package:mobile_ai/core/database/models/operations/employee_task_collection.dart';

import '../../domain/entities/employee_task.dart';

abstract class TaskLocalDataSource {
  Future<List<EmployeeTask>> getTasksForUser(String userId);

  Future<Map<String, List<EmployeeTask>>> getTasksByStatus(String userId);

  Future<EmployeeTask?> getCurrentTask(String userId);

  Future<void> saveTask(EmployeeTask task);

  Future<void> saveTasks(List<EmployeeTask> tasks);

  Future<void> updateTaskStatus(String taskId, TaskStatus status);

  Future<void> updateTaskProgress(String taskId, int itemsCompleted);

  Future<void> clearTasksForUser(String userId);

  Future<void> clearAllTasks();

  Future<EmployeeTask?> getTaskById(String taskId);
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Isar isar;

  TaskLocalDataSourceImpl({required this.isar});

  @override
  Future<List<EmployeeTask>> getTasksForUser(String userId) async {
    try {
      developer.log('📂 Getting tasks from local DB for user: $userId',
          name: 'TaskLocalDataSource');

      final collections = await isar.employeeTaskCollections
          .where()
          .assignedToUserIdEqualTo(userId)
          .findAll();

      final tasks = collections.map(_collectionToEntity).toList();
      developer.log('✅ Found ${tasks.length} tasks locally',
          name: 'TaskLocalDataSource');

      return tasks;
    } catch (e) {
      developer.log('❌ Error getting tasks from local DB: $e',
          name: 'TaskLocalDataSource', error: e);
      return [];
    }
  }

  @override
  Future<Map<String, List<EmployeeTask>>> getTasksByStatus(String userId) async {
    try {
      developer.log('📂 Getting tasks by status from local DB for user: $userId',
          name: 'TaskLocalDataSource');

      final allTasks = await getTasksForUser(userId);

      final pending = allTasks
          .where((t) => t.status == TaskStatus.pending)
          .toList();
      final inProgress = allTasks
          .where((t) => t.status == TaskStatus.inProgress)
          .toList();
      final completed = allTasks
          .where((t) => t.status == TaskStatus.completed)
          .toList();

      developer.log(
        '✅ Tasks by status: ${pending.length} pending, ${inProgress.length} in progress, ${completed.length} completed',
        name: 'TaskLocalDataSource',
      );

      return {
        'pending': pending,
        'in_progress': inProgress,
        'completed': completed,
      };
    } catch (e) {
      developer.log('❌ Error getting tasks by status: $e',
          name: 'TaskLocalDataSource', error: e);
      return {
        'pending': [],
        'in_progress': [],
        'completed': [],
      };
    }
  }

  @override
  Future<EmployeeTask?> getCurrentTask(String userId) async {
    try {
      developer.log(
        '📂 Getting current task from local DB for user: $userId',
        name: 'TaskLocalDataSource',
      );

      final collections = await isar.employeeTaskCollections
          .where()
          .assignedToUserIdEqualTo(userId)
          .findAll();

      final currentTask = collections.firstWhere(
        (t) => t.status == EmployeeTaskStatus.inProgress,
        orElse: () => throw Exception('No current task'),
      );

      developer.log('✅ Current task found: ${currentTask.title}',
          name: 'TaskLocalDataSource');
      return _collectionToEntity(currentTask);
    } catch (e) {
      developer.log('ℹ️ No current task found', name: 'TaskLocalDataSource');
      return null;
    }
  }

  @override
  Future<EmployeeTask?> getTaskById(String taskId) async {
    try {
      final collection = await isar.employeeTaskCollections
          .where()
          .backendIdEqualTo(taskId)
          .findFirst();

      if (collection != null) {
        return _collectionToEntity(collection);
      }

      return null;
    } catch (e) {
      developer.log('❌ Error getting task by ID: $e',
          name: 'TaskLocalDataSource', error: e);
      return null;
    }
  }

  @override
  Future<void> saveTask(EmployeeTask task) async {
    try {
      developer.log('💾 Saving task to local DB: ${task.title}',
          name: 'TaskLocalDataSource');

      final collection = _entityToCollection(task);

      await isar.writeTxn(() async {
        await isar.employeeTaskCollections.put(collection);
      });

      developer.log('✅ Task saved successfully', name: 'TaskLocalDataSource');
    } catch (e) {
      developer.log('❌ Error saving task: $e', name: 'TaskLocalDataSource',
          error: e);
      rethrow;
    }
  }

  @override
  Future<void> saveTasks(List<EmployeeTask> tasks) async {
    try {
      developer.log(
        '💾 Saving ${tasks.length} tasks to local DB',
        name: 'TaskLocalDataSource',
      );

      final collections =
          tasks.map((t) => _entityToCollection(t)).toList();

      await isar.writeTxn(() async {
        await isar.employeeTaskCollections.putAll(collections);
      });

      developer.log('✅ ${tasks.length} tasks saved successfully',
          name: 'TaskLocalDataSource');
    } catch (e) {
      developer.log('❌ Error saving tasks: $e', name: 'TaskLocalDataSource',
          error: e);
      rethrow;
    }
  }

  @override
  Future<void> updateTaskStatus(String taskId, TaskStatus status) async {
    try {
      developer.log(
        '🔄 Updating task status in local DB: $taskId -> ${status.name}',
        name: 'TaskLocalDataSource',
      );

      final collection = await isar.employeeTaskCollections
          .where()
          .backendIdEqualTo(taskId)
          .findFirst();

      if (collection != null) {
        await isar.writeTxn(() async {
          collection.status = _taskStatusToEnum(status);
          await isar.employeeTaskCollections.put(collection);
        });

        developer.log('✅ Task status updated successfully',
            name: 'TaskLocalDataSource');
      } else {
        developer.log('⚠️ Task not found for status update: $taskId',
            name: 'TaskLocalDataSource');
      }
    } catch (e) {
      developer.log('❌ Error updating task status: $e',
          name: 'TaskLocalDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<void> updateTaskProgress(String taskId, int itemsCompleted) async {
    try {
      developer.log(
        '📊 Updating task progress in local DB: $taskId -> $itemsCompleted items',
        name: 'TaskLocalDataSource',
      );

      final collection = await isar.employeeTaskCollections
          .where()
          .backendIdEqualTo(taskId)
          .findFirst();

      if (collection != null) {
        await isar.writeTxn(() async {
          collection.itemsCompleted = itemsCompleted;
          await isar.employeeTaskCollections.put(collection);
        });

        developer.log('✅ Task progress updated successfully',
            name: 'TaskLocalDataSource');
      }
    } catch (e) {
      developer.log('❌ Error updating task progress: $e',
          name: 'TaskLocalDataSource', error: e);
      rethrow;
    }
  }

  @override
  Future<void> clearTasksForUser(String userId) async {
    try {
      developer.log('🗑️ Clearing tasks for user: $userId',
          name: 'TaskLocalDataSource');

      await isar.writeTxn(() async {
        final tasks = await isar.employeeTaskCollections
            .where()
            .assignedToUserIdEqualTo(userId)
            .findAll();

        for (final task in tasks) {
          await isar.employeeTaskCollections.delete(task.id);
        }
      });

      developer.log('✅ Tasks cleared successfully', name: 'TaskLocalDataSource');
    } catch (e) {
      developer.log('❌ Error clearing tasks: $e', name: 'TaskLocalDataSource',
          error: e);
    }
  }

  @override
  Future<void> clearAllTasks() async {
    try {
      developer.log('🗑️ Clearing all tasks from local DB',
          name: 'TaskLocalDataSource');

      await isar.writeTxn(() async {
        await isar.employeeTaskCollections.deleteAll();
      });

      developer.log('✅ All tasks cleared successfully',
          name: 'TaskLocalDataSource');
    } catch (e) {
      developer.log('❌ Error clearing all tasks: $e',
          name: 'TaskLocalDataSource', error: e);
    }
  }

  // Helper methods

  EmployeeTask _collectionToEntity(EmployeeTaskCollection collection) {
    return EmployeeTask(
      id: collection.backendId ?? collection.id.toString(),
      title: collection.title,
      description: collection.description,
      taskType: _enumToTaskType(collection.taskType),
      status: _enumToTaskStatus(collection.status),
      assignedToUserId: collection.assignedToUserId,
      assignedByUserId: collection.assignedByUserId,
      warehouseId: collection.warehouseId,
      dailyOperationId: collection.dailyOperationId,
      priority: collection.priority,
      dueDate: collection.dueDate,
      startedAt: collection.startedAt,
      completedAt: collection.completedAt,
      itemsCount: collection.itemsCount,
      itemsCompleted: collection.itemsCompleted,
      estimatedDurationMinutes: collection.estimatedDurationMinutes,
      notes: collection.notes,
      bonReferenceType: collection.bonReferenceType,
      bonReferenceId: collection.bonReferenceId,
      createdAt: collection.createdAt,
      updatedAt: collection.updatedAt,
    );
  }

  EmployeeTaskCollection _entityToCollection(EmployeeTask entity) {
    return EmployeeTaskCollection.create(
      backendId: entity.id,
      assignedToUserId: entity.assignedToUserId,
      assignedByUserId: entity.assignedByUserId,
      title: entity.title,
      description: entity.description,
      taskType: _taskTypeToEnum(entity.taskType),
      status: _taskStatusToEnum(entity.status),
      warehouseId: entity.warehouseId,
      dailyOperationId: entity.dailyOperationId,
      priority: entity.priority,
      dueDate: entity.dueDate,
      startedAt: entity.startedAt,
      completedAt: entity.completedAt,
      itemsCount: entity.itemsCount,
      itemsCompleted: entity.itemsCompleted,
      estimatedDurationMinutes: entity.estimatedDurationMinutes,
      notes: entity.notes,
      bonReferenceType: entity.bonReferenceType,
      bonReferenceId: entity.bonReferenceId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  TaskType _enumToTaskType(EmployeeTaskType type) {
    switch (type) {
      case EmployeeTaskType.receipt:
        return TaskType.receipt;
      case EmployeeTaskType.picking:
        return TaskType.picking;
      case EmployeeTaskType.preparation:
        return TaskType.preparation;
      case EmployeeTaskType.replenishment:
        return TaskType.replenishment;
      case EmployeeTaskType.delivery:
        return TaskType.delivery;
      case EmployeeTaskType.storage:
        return TaskType.storage;
    }
  }

  EmployeeTaskType _taskTypeToEnum(TaskType type) {
    switch (type) {
      case TaskType.receipt:
        return EmployeeTaskType.receipt;
      case TaskType.picking:
        return EmployeeTaskType.picking;
      case TaskType.preparation:
        return EmployeeTaskType.preparation;
      case TaskType.replenishment:
        return EmployeeTaskType.replenishment;
      case TaskType.delivery:
        return EmployeeTaskType.delivery;
      case TaskType.storage:
        return EmployeeTaskType.storage;
    }
  }

  TaskStatus _enumToTaskStatus(EmployeeTaskStatus status) {
    switch (status) {
      case EmployeeTaskStatus.pending:
        return TaskStatus.pending;
      case EmployeeTaskStatus.inProgress:
        return TaskStatus.inProgress;
      case EmployeeTaskStatus.completed:
        return TaskStatus.completed;
      case EmployeeTaskStatus.cancelled:
        return TaskStatus.cancelled;
    }
  }

  EmployeeTaskStatus _taskStatusToEnum(TaskStatus status) {
    switch (status) {
      case TaskStatus.pending:
        return EmployeeTaskStatus.pending;
      case TaskStatus.inProgress:
        return EmployeeTaskStatus.inProgress;
      case TaskStatus.completed:
        return EmployeeTaskStatus.completed;
      case TaskStatus.cancelled:
        return EmployeeTaskStatus.cancelled;
    }
  }
}
