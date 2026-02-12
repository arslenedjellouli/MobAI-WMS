# Core Module

Contains shared utilities, constants, and configurations used across the entire application.

## Structure

### `/constants`
- `api_constants.dart` - API endpoints, base URLs
- `app_constants.dart` - App-wide constants (pagination, timeouts, etc.)
- `storage_keys.dart` - Local storage keys for offline data
- `role_constants.dart` - User role enums and permissions

### `/theme`
- `app_theme.dart` - Material theme configuration
- `app_colors.dart` - Color palette
- `app_text_styles.dart` - Typography styles
- `app_dimensions.dart` - Spacing, padding, sizes

### `/utils`
- `date_utils.dart` - Date formatting and manipulation
- `validators.dart` - Form validation helpers
- `formatters.dart` - Text formatters (currency, quantity, etc.)
- `permissions_utils.dart` - Role-based permission checks

### `/extensions`
- `context_extensions.dart` - BuildContext extensions
- `string_extensions.dart` - String helpers
- `datetime_extensions.dart` - DateTime helpers
- `num_extensions.dart` - Number formatting extensions

### `/errors`
- `exceptions.dart` - Custom exception classes
- `failures.dart` - Failure types for error handling
- `error_handler.dart` - Global error handling logic

### `/network`
- `api_client.dart` - HTTP client wrapper (Dio/http)
- `network_info.dart` - Connectivity checker
- `api_interceptors.dart` - Request/response interceptors (auth, logging)

### `/database`
- `database_helper.dart` - SQLite initialization
- `database_constants.dart` - Table names, column names
- `migrations/` - Database migration scripts

### `/sync`
- `sync_manager.dart` - Offline-first sync coordinator
- `sync_queue.dart` - Queue management for pending operations
- `conflict_resolver.dart` - Optimistic locking conflict resolution

## Guidelines

- All code in `core/` should be **framework-agnostic** where possible
- No feature-specific logic - only shared utilities
- Prefer extension methods over utility classes
- Document all public APIs
