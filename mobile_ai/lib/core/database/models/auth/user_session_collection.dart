import 'package:isar/isar.dart';

part 'user_session_collection.g.dart';

/// User Session Collection - Tracks login/logout history
@collection
class UserSessionCollection {
  Id id = Isar.autoIncrement;

  /// Session ID from backend (if provided)
  String? backendId;

  /// User ID
  @Index()
  late String userId;

  /// Login timestamp
  @Name("login_time")
  late DateTime loginTime;

  /// Logout timestamp
  @Name("logout_time")
  DateTime? logoutTime;

  /// Device information
  @Name("device_info")
  String? deviceInfo;

  /// IP address (if available)
  @Name("ip_address")
  String? ipAddress;

  UserSessionCollection();

  UserSessionCollection.create({
    this.backendId,
    required this.userId,
    required this.loginTime,
    this.logoutTime,
    this.deviceInfo,
    this.ipAddress,
  });

  /// Check if session is active
  @ignore
  bool get isActive => logoutTime == null;

  /// Calculate session duration
  @ignore
  Duration get duration {
    final endTime = logoutTime ?? DateTime.now();
    return endTime.difference(loginTime);
  }
}
