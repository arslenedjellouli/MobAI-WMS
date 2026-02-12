/// Local storage keys for SharedPreferences and SecureStorage
class StorageKeys {
  StorageKeys._();

  // Authentication
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userRole = 'user_role';
  static const String userEmail = 'user_email';
  static const String userName = 'user_name';
  static const String rememberMe = 'remember_me';

  // App State
  static const String selectedWarehouseId = 'selected_warehouse_id';
  static const String selectedDailyOperationId = 'selected_daily_operation_id';
  static const String lastSyncTimestamp = 'last_sync_timestamp';
  static const String isOnboarded = 'is_onboarded';

  // Offline Data
  static const String syncQueue = 'sync_queue';
  static const String pendingOperations = 'pending_operations';
  static const String cachedData = 'cached_data_';

  // Settings
  static const String themeMode = 'theme_mode';
  static const String language = 'language';
  static const String notificationsEnabled = 'notifications_enabled';
  static const String locationTrackingEnabled = 'location_tracking_enabled';

  // Device
  static const String deviceId = 'device_id';
  static const String deviceInfo = 'device_info';
}