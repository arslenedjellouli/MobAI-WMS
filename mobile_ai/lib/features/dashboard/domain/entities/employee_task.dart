import 'package:equatable/equatable.dart';

enum TaskType { receipt, picking, preparation, replenishment, delivery, storage }

enum TaskStatus { pending, inProgress, completed, cancelled }

class EmployeeTask extends Equatable {
  final String id;
  final String title;
  final String? description;
  final TaskType taskType;
  final TaskStatus status;
  final String assignedToUserId;
  final String? assignedByUserId;
  final String warehouseId;
  final String? dailyOperationId;
  final int priority;
  final DateTime? dueDate;
  final DateTime? startedAt;
  final DateTime? completedAt;
  final int itemsCount;
  final int itemsCompleted;
  final int? estimatedDurationMinutes;
  final String? notes;
  final String? bonReferenceType;
  final String? bonReferenceId;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const EmployeeTask({
    required this.id,
    required this.title,
    this.description,
    required this.taskType,
    required this.status,
    required this.assignedToUserId,
    this.assignedByUserId,
    required this.warehouseId,
    this.dailyOperationId,
    required this.priority,
    this.dueDate,
    this.startedAt,
    this.completedAt,
    required this.itemsCount,
    required this.itemsCompleted,
    this.estimatedDurationMinutes,
    this.notes,
    this.bonReferenceType,
    this.bonReferenceId,
    required this.createdAt,
    this.updatedAt,
  });

  double get progress {
    if (itemsCount == 0) return 0.0;
    return (itemsCompleted / itemsCount) * 100;
  }

  bool get isActive => status == TaskStatus.inProgress;
  bool get isCompleted => status == TaskStatus.completed;
  bool get isPending => status == TaskStatus.pending;

  bool get isOverdue {
    if (dueDate == null || isCompleted) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  String get taskTypeLabel {
    switch (taskType) {
      case TaskType.receipt:
        return 'Receipt';
      case TaskType.picking:
        return 'Picking';
      case TaskType.preparation:
        return 'Preparation';
      case TaskType.replenishment:
        return 'Replenishment';
      case TaskType.delivery:
        return 'Delivery';
      case TaskType.storage:
        return 'Storage';
    }
  }

  String get statusLabel {
    switch (status) {
      case TaskStatus.pending:
        return 'Pending';
      case TaskStatus.inProgress:
        return 'In Progress';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.cancelled:
        return 'Cancelled';
    }
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        taskType,
        status,
        assignedToUserId,
        assignedByUserId,
        warehouseId,
        dailyOperationId,
        priority,
        dueDate,
        startedAt,
        completedAt,
        itemsCount,
        itemsCompleted,
        estimatedDurationMinutes,
        notes,
        bonReferenceType,
        bonReferenceId,
        createdAt,
        updatedAt,
      ];

  EmployeeTask copyWith({
    String? id,
    String? title,
    String? description,
    TaskType? taskType,
    TaskStatus? status,
    String? assignedToUserId,
    String? assignedByUserId,
    String? warehouseId,
    String? dailyOperationId,
    int? priority,
    DateTime? dueDate,
    DateTime? startedAt,
    DateTime? completedAt,
    int? itemsCount,
    int? itemsCompleted,
    int? estimatedDurationMinutes,
    String? notes,
    String? bonReferenceType,
    String? bonReferenceId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      EmployeeTask(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        taskType: taskType ?? this.taskType,
        status: status ?? this.status,
        assignedToUserId: assignedToUserId ?? this.assignedToUserId,
        assignedByUserId: assignedByUserId ?? this.assignedByUserId,
        warehouseId: warehouseId ?? this.warehouseId,
        dailyOperationId: dailyOperationId ?? this.dailyOperationId,
        priority: priority ?? this.priority,
        dueDate: dueDate ?? this.dueDate,
        startedAt: startedAt ?? this.startedAt,
        completedAt: completedAt ?? this.completedAt,
        itemsCount: itemsCount ?? this.itemsCount,
        itemsCompleted: itemsCompleted ?? this.itemsCompleted,
        estimatedDurationMinutes:
            estimatedDurationMinutes ?? this.estimatedDurationMinutes,
        notes: notes ?? this.notes,
        bonReferenceType: bonReferenceType ?? this.bonReferenceType,
        bonReferenceId: bonReferenceId ?? this.bonReferenceId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
