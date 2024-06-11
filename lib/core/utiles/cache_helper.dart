import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences? sharedPreferences;

  static init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static saveString({
    required String key,
    required String value,
})async{
    return await sharedPreferences!.setString(key, value);
  }

  static getString({
    required String key,
  })async{
    return sharedPreferences!.getString(key);
  }
}