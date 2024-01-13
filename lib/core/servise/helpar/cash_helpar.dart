import 'package:shared_preferences/shared_preferences.dart';

class CachHelper {
  static SharedPreferences? sharedpreferences;

  static init() async {
    sharedpreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(String key, bool value) async {
    return await sharedpreferences!.setBool(key, value) as bool;
  }

  static boolgetData(String key) {
    return sharedpreferences!.getBool(key);
  }
}
