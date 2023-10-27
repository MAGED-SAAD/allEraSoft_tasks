import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? myObject;

  static void init_SharedPref() async {
    myObject = await SharedPreferences.getInstance();
  }

  static void setData({required String key, required dynamic value}) {
    if (value is int) {
      myObject?.setInt(key, value);
    } else if (value is bool) {
      myObject?.setBool(key, value);
    } else if (value is String) {
      myObject?.setString(key, value);
    } else if (value is double) {
      myObject?.setDouble(key, value);
    } else if (value is List<String>) {
      myObject?.setStringList(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return myObject?.get(key);
  }


    static void removeData({required String key}) {
     myObject?.remove(key);
  }




      static void clearDataAll({required String key}) {
     myObject?.clear();
  }



}
