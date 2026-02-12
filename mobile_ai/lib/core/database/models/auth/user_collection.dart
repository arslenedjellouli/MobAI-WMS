import 'package:isar/isar.dart';

part 'user_collection.g.dart';

/// User Collection - Stores current logged-in user information
@collection
class UserCollection {
  Id id = Isar.autoIncrement;

  /// User ID from backend (UUID)
  @Index(unique: true)
  String? backendId;

  /// User's full name
  @Name("full_name")
  late String fullName;

  /// User's email
  @Index()
  late String email;

  /// User's role
  @enumerated
  late UserRole role;

  /// Account status
  @enumerated
  late UserStatus status;

  /// Assigned warehouse ID (for employees)
  @Name("warehouse_id")
  String? warehouseId;

  /// JWT access token (stored securely)
  String? accessToken;

  /// JWT refresh token
  String? refreshToken;

  /// Token expiration time
  @Name("token_expires_at")
  DateTime? tokenExpiresAt;

  /// Last login timestamp
  @Name("last_login_at")
  DateTime? lastLoginAt;

  /// Account created at
  @Name("created_at")
  late DateTime createdAt;

  UserCollection();

  UserCollection.create({
    this.backendId,
    required this.fullName,
    required this.email,
    required this.role,
    this.status = UserStatus.active,
    this.warehouseId,
    this.accessToken,
    this.refreshToken,
    this.tokenExpiresAt,
    this.lastLoginAt,
    required this.createdAt,
  });

  /// Check if access token is valid
  @ignore
  bool get isTokenValid {
    if (accessToken == null || tokenExpiresAt == null) return false;
    return DateTime.now().isBefore(tokenExpiresAt!);
  }

  /// Check if user is admin
  @ignore
  bool get isAdmin => role == UserRole.admin;

  /// Check if user is supervisor or admin
  @ignore
  bool get isSupervisor => role == UserRole.admin || role == UserRole.supervisor;

  /// Check if user is employee (any role)
  @ignore
  bool get isEmployee => true;
}

/// User roles in the system
enum UserRole {
  admin,
  supervisor,
  employee,
}

/// User account status
enum UserStatus {
  active,
  disabled,
}
