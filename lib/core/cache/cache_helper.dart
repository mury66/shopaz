import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _prefs;

  /// Call this before using the CacheHelper (usually in main)
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save data
  static Future<bool> saveString(String key, String value) async {
    return await _prefs!.setString(key, value);
  }

  static Future<bool> saveInt(String key, int value) async {
    return await _prefs!.setInt(key, value);
  }

  static Future<bool> saveBool(String key, bool value) async {
    return await _prefs!.setBool(key, value);
  }

  static Future<bool> saveDouble(String key, double value) async {
    return await _prefs!.setDouble(key, value);
  }

  // Read data
  static String? getString(String key) => _prefs!.getString(key);

  static int? getInt(String key) => _prefs!.getInt(key);

  static bool? getBool(String key) => _prefs!.getBool(key);

  static double? getDouble(String key) => _prefs!.getDouble(key);

  // Remove key
  static Future<bool> remove(String key) async {
    return await _prefs!.remove(key);
  }

  // Clear all
  static Future<bool> clear() async {
    return await _prefs!.clear();
  }

  // Check if key exists
  static bool containsKey(String key) => _prefs!.containsKey(key);
}
