import 'package:isar/isar.dart';

part 'task_report_collection.g.dart';

@collection
class TaskReportCollection {
  Id id = Isar.autoIncrement;

  @Index()
  String? backendId; // UUID from backend

  @Index()
  String? taskId; // Task backend ID

  String? taskTitle;
  
  @Index()
  String? reportedById; // Reporter's backend ID
  
  String? reportedByName;
  String? reportedByEmail;
  
  String? supervisorId;
  String? supervisorName;
  
  @Index(type: IndexType.value)
  List<String> issues = []; // List of issue types
  
  String? description;
  
  @Index()
  @Enumerated(EnumType.name)
  TaskReportStatus status = TaskReportStatus.pending;
  
  DateTime reportedAt = DateTime.now();
  DateTime? acknowledgedAt;
  DateTime? resolvedAt;
  
  String? supervisorNotes;
  
  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
  
  bool syncStatus = false; // true if synced with backend
  
  TaskReportCollection();
  
  factory TaskReportCollection.create({
    String? backendId,
    required String taskId,
    String? taskTitle,
    required String reportedById,
    String? reportedByName,
    String? reportedByEmail,
    String? supervisorId,
    String? supervisorName,
    required List<String> issues,
    String? description,
    TaskReportStatus status = TaskReportStatus.pending,
    DateTime? reportedAt,
    bool syncStatus = false,
  }) {
    return TaskReportCollection()
      ..backendId = backendId
      ..taskId = taskId
      ..taskTitle = taskTitle
      ..reportedById = reportedById
      ..reportedByName = reportedByName
      ..reportedByEmail = reportedByEmail
      ..supervisorId = supervisorId
      ..supervisorName = supervisorName
      ..issues = issues
      ..description = description
      ..status = status
      ..reportedAt = reportedAt ?? DateTime.now()
      ..syncStatus = syncStatus
      ..createdAt = DateTime.now()
      ..updatedAt = DateTime.now();
  }
  
  factory TaskReportCollection.fromJson(Map<String, dynamic> json) {
    return TaskReportCollection()
      ..backendId = json['id'] as String?
      ..taskId = (json['task'] is Map) ? json['task']['id'] as String? : json['task_id'] as String?
      ..taskTitle = (json['task'] is Map) ? json['task']['title'] as String? : null
      ..reportedById = (json['reported_by'] is Map) 
          ? json['reported_by']['id'] as String? 
          : json['reported_by_id'] as String?
      ..reportedByName = (json['reported_by'] is Map) 
          ? json['reported_by']['full_name'] as String? 
          : json['reported_by_name'] as String?
      ..reportedByEmail = (json['reported_by'] is Map) 
          ? json['reported_by']['email'] as String? 
          : json['reported_by_email'] as String?
      ..supervisorId = (json['supervisor'] is Map) 
          ? json['supervisor']['id'] as String? 
          : json['supervisor_id'] as String?
      ..supervisorName = (json['supervisor'] is Map) 
          ? json['supervisor']['full_name'] as String? 
          : null
      ..issues = (json['issues'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? []
      ..description = json['description'] as String?
      ..status = _parseStatus(json['status'] as String?)
      ..reportedAt = DateTime.parse(json['reported_at'] ?? json['created_at'] ?? DateTime.now().toIso8601String())
      ..acknowledgedAt = json['acknowledged_at'] != null ? DateTime.parse(json['acknowledged_at']) : null
      ..resolvedAt = json['resolved_at'] != null ? DateTime.parse(json['resolved_at']) : null
      ..supervisorNotes = json['supervisor_notes'] as String?
      ..createdAt = DateTime.parse(json['created_at'] ?? DateTime.now().toIso8601String())
      ..updatedAt = DateTime.parse(json['updated_at'] ?? DateTime.now().toIso8601String())
      ..syncStatus = true;
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': backendId,
      'task_id': taskId,
      'task_title': taskTitle,
      'reported_by_id': reportedById,
      'reported_by_name': reportedByName,
      'reported_by_email': reportedByEmail,
      'supervisor_id': supervisorId,
      'supervisor_name': supervisorName,
      'issues': issues,
      'description': description,
      'status': status.name.toUpperCase(),
      'reported_at': reportedAt.toIso8601String(),
      'acknowledged_at': acknowledgedAt?.toIso8601String(),
      'resolved_at': resolvedAt?.toIso8601String(),
      'supervisor_notes': supervisorNotes,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'sync_status': syncStatus,
    };
  }
  
  static TaskReportStatus _parseStatus(String? status) {
    if (status == null) return TaskReportStatus.pending;
    switch (status.toUpperCase()) {
      case 'PENDING':
        return TaskReportStatus.pending;
      case 'ACKNOWLEDGED':
        return TaskReportStatus.acknowledged;
      case 'RESOLVED':
        return TaskReportStatus.resolved;
      default:
        return TaskReportStatus.pending;
    }
  }
}

enum TaskReportStatus {
  pending,
  acknowledged,
  resolved,
}
