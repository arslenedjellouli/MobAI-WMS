import 'package:mobile_ai/core/constants/role_constants.dart';

/// Pure business entity for User
/// NO dependencies on external packages (pure Dart)
class UserEntity {
  final int id;
  final String fullName;
  final String email;
  final UserRole role;
  final String status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.role,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  bool get isActive => status == 'ACTIVE';
  bool get isAdmin => role == UserRole.admin;
  bool get isSupervisor => role == UserRole.supervisor;
  bool get isEmployee => role == UserRole.employee;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'UserEntity(id: $id, name: $fullName, role: ${role.value})';
  }
}