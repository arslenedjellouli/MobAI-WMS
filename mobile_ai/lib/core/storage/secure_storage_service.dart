import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_ai/core/errors/exceptions.dart';

/// Secure storage service for sensitive data (tokens, passwords)
class SecureStorageService {
  final FlutterSecureStorage secureStorage;

  SecureStorageService({required this.secureStorage});

  /// Save secure value
  Future<void> save(String key, String value) async {
    try {
      await secureStorage.write(key: key, value: value);
    } catch (e) {
      throw CacheException('Failed to save secure value: $e');
    }
  }

  /// Get secure value
  Future<String?> get(String key) async {
    try {
      return await secureStorage.read(key: key);
    } catch (e) {
      throw CacheException('Failed to get secure value: $e');
    }
  }

  /// Remove secure value
  Future<void> remove(String key) async {
    try {
      await secureStorage.delete(key: key);
    } catch (e) {
      throw CacheException('Failed to remove secure value: $e');
    }
  }

  /// Clear all secure values
  Future<void> clear() async {
    try {
      await secureStorage.deleteAll();
    } catch (e) {
      throw CacheException('Failed to clear secure storage: $e');
    }
  }

  /// Check if key exists
  Future<bool> containsKey(String key) async {
    try {
      return await secureStorage.containsKey(key: key);
    } catch (e) {
      throw CacheException('Failed to check key existence: $e');
    }
  }

  /// Get all keys
  Future<Map<String, String>> getAll() async {
    try {
      return await secureStorage.readAll();
    } catch (e) {
      throw CacheException('Failed to get all values: $e');
    }
  }
}
