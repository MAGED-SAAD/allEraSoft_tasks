import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/EndPoints.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
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
    String? Token,
  }) async {
    try {
      Response? response = await dio?.get(endPoint);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Response?> post({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? Prams,
    required Map<String, dynamic>? data,
    String? Token,
  }) async {
    try {
      Response? response = await dio?.post(endPoint, data: data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
