import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static late SharedPreferences sharedPreferences;
  static const tokenKey = 'token';


  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setString(
      {required String key, required String value}) async {
    await sharedPreferences.setString(key, value);
  }

  static String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }
  static Future<void>setInt({required String key,required int value})async{
    await sharedPreferences.setInt(key, value);
  }
  static int? getInt({required String key}){
    return sharedPreferences.getInt(key);
  }
  static Future<void>setDouble({required String key,required double value})async{
    await sharedPreferences.setDouble(key, value);
  }
  static double? getDouble({required String key}){
    return sharedPreferences.getDouble(key);
  }
  static Future<void>setBool({required String key,required bool value})async{
    await sharedPreferences.setBool(key, value);
  }
  static bool? getBool({required String key}){
    return sharedPreferences.getBool(key);
  }
}
