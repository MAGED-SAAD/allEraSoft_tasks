import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/EndPoints.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/Utils/sharedPrefStrings.dart';
import 'package:cubiterasoft/Dark%20ToDo%20App/View_Model/Utils/data/Local/SharedPref.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static String? currentUserId = SharedPref.getData(key: SharedStrins.Token);

  static void init() {
    dio = Dio(BaseOptions(
      baseUrl: EndPoints.todoBaseUrl,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      //baseUrl: EndPoints.todoBaseUrl,
      //EndPoints.PokemonUrl,
      receiveDataWhenStatusError: true,
//contentType: false
    ));
  }

  static Future<Response?> get({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? Prams,
  }) async {
    try {
      Response? response = await dio?.get(endPoint,
          queryParameters: Prams,
          options: currentUserId != null
              ? Options(headers: {"Authorization": "Bearer $currentUserId"})
              : null);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response?> post({
    required String endPoint,
    //Map<String, dynamic>? Prams,
    Map<String, dynamic>? headers,
    required Map<String, dynamic>? data,
    //String? Token,
  }) async {
    try {
      Response? response = await dio?.post(endPoint,
          data: data, options: Options(headers: headers));
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response?> deletee({
    required String endPoint,
    //Map<String, dynamic>? Prams,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
    //String? Token,
  }) async {
    try {
      Response? response = await dio?.delete(endPoint,
          data: data,
          options: currentUserId != null
              ? Options(headers: {"Authorization": "Bearer $currentUserId"})
              : null);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
