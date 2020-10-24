//dependent of shared_preferences package
import 'package:shared_preferences/shared_preferences.dart';

class PrefsWrapper<T> {
  final String key;

  PrefsWrapper(String key) : this.key = "PrefsWrapper$key" {
    if (![int, double, String, bool].any((t) => t == T)) {
      throw ArgumentError(
          "Only native type allowed, given type ${T.toString()}");
    }
  }

  Future<bool> save(T value) async {
    final prefs = await SharedPreferences.getInstance();
    switch (T) {
      case int:
        return prefs.setInt(key, value as int);
      case double:
        return prefs.setDouble(key, value as double);
      case String:
        return prefs.setString(key, value as String);
      case bool:
        return prefs.setBool(key, value as bool);
      default:
        throw ArgumentError("Non native type not possible here.");
    }
  }

  Future<T> load() async {
    final prefs = await SharedPreferences.getInstance();
    switch (T) {
      case int:
        return prefs.getInt(key) as T;
      case double:
        return prefs.getDouble(key) as T;
      case String:
        return prefs.getString(key) as T;
      case bool:
        return prefs.getBool(key) as T;
      default:
        throw ArgumentError("Non native type not possible here.");
    }
  }
}
