import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class sp_data {
  static Object? put( String key , Object? value) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(value is  int ){
      await prefs.setInt(key, value);
    }else if(value is double){
      await prefs.setDouble(key, value);
    }else if(value is bool){
      await prefs.setBool(key, value);
    }else if(value is String){
      await prefs.setString(key, value);
    }else if(value is List<String>){
      await prefs.setStringList(key, value);
    }
  }

  static Future<dynamic?>  get(String key ,Object defaultValue) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    dynamic? currValue;

    if(defaultValue is  int) {
      currValue= prefs.getInt(key);
    }
    else if(defaultValue is  double) {
      currValue= prefs.getDouble(key);
    }
    else if(defaultValue is bool) {
      currValue= prefs.getBool(key);
    }
    else if(defaultValue is String) {
      currValue= prefs.getString(key);
    }
    else if(defaultValue is List) {
      currValue= prefs.getStringList(key);
    }else{
      currValue= Future.value(defaultValue);

    }

    if( currValue==null){
      currValue= Future.value(defaultValue);
    }

    return currValue;
  }

  static void del(String key)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key); //删除指定键
  }

  static void clear()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear(); ////清空缓存
  }
}
