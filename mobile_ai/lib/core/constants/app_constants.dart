/// Application-wide constants
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'MobAI WMS';
  static const String appVersion = '1.0.0';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Timeouts
  static const int apiTimeoutSeconds = 30;
  static const int syncTimeoutSeconds = 60;
  static const int locationUpdateIntervalSeconds = 10;

  // Sync
  static const int syncIntervalMinutes = 5;
  static const int maxRetryAttempts = 3;
  static const int retryDelaySeconds = 5;

  // Cache
  static const int cacheValidityHours = 24;
  static const int maxCacheSize = 100; // MB

  // UI
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 8.0;
  static const int debounceMilliseconds = 300;
  static const int snackbarDurationSeconds = 3;

  // Map/Cartography
  static const double defaultZoomLevel = 15.0;
  static const int heatmapRefreshSeconds = 30;

  // Barcode Scanner
  static const int scanTimeoutSeconds = 30;

  // File Upload
  static const int maxFileSize = 10; // MB
  static const List<String> allowedFileTypes = ['jpg', 'png', 'pdf'];
}