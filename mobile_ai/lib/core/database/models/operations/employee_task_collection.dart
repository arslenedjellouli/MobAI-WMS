import 'package:isar/isar.dart';

part 'employee_task_collection.g.dart';

/// Employee Task Collection - Tasks assigned to warehouse employees
@collection
class EmployeeTaskCollection {
  Id id = Isar.autoIncrement;

  // Sync fields
  @Index()
  String? backendId;
  bool syncStatus = false;
  DateTime? remoteUpdateAt;

  // Business fields
  @Index()
  late String assignedToUserId;
  String? assignedByUserId;

  late String title;
  String? description;

  @Index()
  @enumerated
  late EmployeeTaskType taskType;

  @Index()
  @enumerated
  late EmployeeTaskStatus status;

  @Index()
  late String warehouseId;

  String? dailyOperationId;

  // Priority and timing
  late int priority;
  DateTime? dueDate;
  DateTime? startedAt;
  DateTime? completedAt;

  // Progress tracking
  late int itemsCount;
  late int itemsCompleted;
  int? estimatedDurationMinutes;

  // Additional info
  String? notes;
  String? bonReferenceType;
  String? bonReferenceId;

  late DateTime createdAt;
  DateTime? updatedAt;

  EmployeeTaskCollection();

  EmployeeTaskCollection.create({
    this.backendId,
    required this.assignedToUserId,
    this.assignedByUserId,
    required this.title,
    this.description,
    required this.taskType,
    this.status = EmployeeTaskStatus.pending,
    required this.warehouseId,
    this.dailyOperationId,
    this.priority = 0,
    this.dueDate,
    this.startedAt,
    this.completedAt,
    this.itemsCount = 0,
    this.itemsCompleted = 0,
    this.estimatedDurationMinutes,
    this.notes,
    this.bonReferenceType,
    this.bonReferenceId,
    required this.createdAt,
    this.updatedAt,
    this.syncStatus = false,
    this.remoteUpdateAt,
  });

  @ignore
  double get progress {
    if (itemsCount == 0) return 0.0;
    return (itemsCompleted / itemsCount) * 100;
  }

  @ignore
  bool get isActive => status == EmployeeTaskStatus.inProgress;

  @ignore
  bool get isCompleted => status == EmployeeTaskStatus.completed;

  @ignore
  bool get isPending => status == EmployeeTaskStatus.pending;

  @ignore
  bool get isOverdue {
    if (dueDate == null || isCompleted) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  @ignore
  String get taskTypeLabel {
    switch (taskType) {
      case EmployeeTaskType.receipt:
        return 'Receipt';
      case EmployeeTaskType.picking:
        return 'Picking';
      case EmployeeTaskType.preparation:
        return 'Preparation';
      case EmployeeTaskType.replenishment:
        return 'Replenishment';
      case EmployeeTaskType.delivery:
        return 'Delivery';
      case EmployeeTaskType.storage:
        return 'Storage';
    }
  }

  @ignore
  String get statusLabel {
    switch (status) {
      case EmployeeTaskStatus.pending:
        return 'Pending';
      case EmployeeTaskStatus.inProgress:
        return 'In Progress';
      case EmployeeTaskStatus.completed:
        return 'Completed';
      case EmployeeTaskStatus.cancelled:
        return 'Cancelled';
    }
  }
}

enum EmployeeTaskType {
  receipt,
  picking,
  preparation,
  replenishment,
  delivery,
  storage,
}

enum EmployeeTaskStatus {
  pending,
  inProgress,
  completed,
  cancelled,
}
