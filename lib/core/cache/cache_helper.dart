import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  CacheHelper._internal();
  static final CacheHelper _instance = CacheHelper._internal();
  static late SharedPreferences sharedPreferences;

  static Future<void>init() async => sharedPreferences = await SharedPreferences.getInstance();

  static Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }

    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }

    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  static Future<bool> clearData({required String key}) async {
    return sharedPreferences.clear();
  }

}
