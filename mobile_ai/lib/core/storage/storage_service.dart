import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_ai/core/errors/exceptions.dart';

/// Storage service for local data persistence
class StorageService {
  final SharedPreferences sharedPreferences;

  StorageService({required this.sharedPreferences});

  /// Save string value
  Future<void> saveString(String key, String value) async {
    try {
      await sharedPreferences.setString(key, value);
    } catch (e) {
      throw CacheException('Failed to save string: $e');
    }
  }

  /// Get string value
  String? getString(String key) {
    try {
      return sharedPreferences.getString(key);
    } catch (e) {
      throw CacheException('Failed to get string: $e');
    }
  }

  /// Save int value
  Future<void> saveInt(String key, int value) async {
    try {
      await sharedPreferences.setInt(key, value);
    } catch (e) {
      throw CacheException('Failed to save int: $e');
    }
  }

  /// Get int value
  int? getInt(String key) {
    try {
      return sharedPreferences.getInt(key);
    } catch (e) {
      throw CacheException('Failed to get int: $e');
    }
  }

  /// Save bool value
  Future<void> saveBool(String key, bool value) async {
    try {
      await sharedPreferences.setBool(key, value);
    } catch (e) {
      throw CacheException('Failed to save bool: $e');
    }
  }

  /// Get bool value
  bool? getBool(String key) {
    try {
      return sharedPreferences.getBool(key);
    } catch (e) {
      throw CacheException('Failed to get bool: $e');
    }
  }

  /// Save double value
  Future<void> saveDouble(String key, double value) async {
    try {
      await sharedPreferences.setDouble(key, value);
    } catch (e) {
      throw CacheException('Failed to save double: $e');
    }
  }

  /// Get double value
  double? getDouble(String key) {
    try {
      return sharedPreferences.getDouble(key);
    } catch (e) {
      throw CacheException('Failed to get double: $e');
    }
  }

  /// Save list of strings
  Future<void> saveStringList(String key, List<String> value) async {
    try {
      await sharedPreferences.setStringList(key, value);
    } catch (e) {
      throw CacheException('Failed to save string list: $e');
    }
  }

  /// Get list of strings
  List<String>? getStringList(String key) {
    try {
      return sharedPreferences.getStringList(key);
    } catch (e) {
      throw CacheException('Failed to get string list: $e');
    }
  }

  /// Remove value
  Future<void> remove(String key) async {
    try {
      await sharedPreferences.remove(key);
    } catch (e) {
      throw CacheException('Failed to remove value: $e');
    }
  }

  /// Clear all values
  Future<void> clear() async {
    try {
      await sharedPreferences.clear();
    } catch (e) {
      throw CacheException('Failed to clear storage: $e');
    }
  }

  /// Check if key exists
  bool containsKey(String key) {
    return sharedPreferences.containsKey(key);
  }

  /// Get all keys
  Set<String> getKeys() {
    return sharedPreferences.getKeys();
  }
}
