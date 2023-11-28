import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? myObject;

  static String? datefrom;
  static String? dateTo;
  static String? status;


  static init_SharedPref() async {
    myObject = await SharedPreferences.getInstance();
  }

  static void setData({required String key, required dynamic value}) async {
    if (value is int) {
      await myObject?.setInt(key, value);
    } else if (value is bool) {
      await myObject?.setBool(key, value);
    } else if (value is String) {
      await myObject?.setString(key, value);
      //print("save string done: Value:$value");
    } else if (value is double) {
      await myObject?.setDouble(key, value);
    } else if (value is List<String>) {
      await myObject?.setStringList(key, value);
    }
  }

  static dynamic getData({required String key}) {
    return myObject!.get(key);
  }

  static void removeData({required String key}) {
    myObject?.remove(key);
  }

  static void clearDataAll() {
    myObject?.clear();
  }
}
