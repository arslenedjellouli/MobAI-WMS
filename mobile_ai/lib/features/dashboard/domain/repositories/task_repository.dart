import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/employee_task.dart';

abstract class TaskRepository {
  /// Get all tasks assigned to a user
  Future<Either<Failure, List<EmployeeTask>>> getTasksForUser(String userId);

  /// Get tasks by status (pending, in_progress, completed)
  Future<Either<Failure, Map<String, List<EmployeeTask>>>> getTasksByStatus(
      String userId);

  /// Get current active task
  Future<Either<Failure, EmployeeTask?>> getCurrentTask(String userId);

  /// Start a task (change status from PENDING to IN_PROGRESS)
  Future<Either<Failure, EmployeeTask>> startTask(String taskId);

  /// Complete a task
  Future<Either<Failure, EmployeeTask>> completeTask(String taskId);

  /// Update task progress
  Future<Either<Failure, EmployeeTask>> updateTaskProgress(
      String taskId, int itemsCompleted);

  /// Update task status
  Future<Either<Failure, EmployeeTask>> updateTaskStatus(
      String taskId, TaskStatus newStatus);

  /// Get task details
  Future<Either<Failure, EmployeeTask>> getTaskDetails(String taskId);

  /// Get dashboard summary (current, remaining, completed)
  Future<Either<Failure, DashboardTaskSummary>> getDashboardSummary(
      String userId);
}

class DashboardTaskSummary {
  final EmployeeTask? currentTask;
  final List<EmployeeTask> remainingTasks;
  final List<EmployeeTask> completedTasks;
  final int totalTasks;

  DashboardTaskSummary({
    this.currentTask,
    List<EmployeeTask>? remainingTasks,
    List<EmployeeTask>? completedTasks,
    required this.totalTasks,
  })  : remainingTasks = remainingTasks ?? [],
        completedTasks = completedTasks ?? [];
}
