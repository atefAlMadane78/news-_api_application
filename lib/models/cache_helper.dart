import 'package:shared_preferences/shared_preferences.dart';

class cache_helper{
  static late SharedPreferences pre;

  static init() async{
    pre = await SharedPreferences.getInstance();
  }

  static Future<bool> putBoolean({
    required String key,
    required bool value,
  }) async{
    return await pre.setBool(key, value) ;
  }

   static bool getBoolean({
    required String key,
  }) {
    print(pre.getBool(key));
    return  pre.getBool(key) ?? false;
    
  }
}