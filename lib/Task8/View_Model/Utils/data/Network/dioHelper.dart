import 'package:cubiterasoft/Task8/View_Model/Utils/Utils/EndPoints.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(BaseOptions(
      //baseUrl: EndPoints.PokemonUrl,
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
}
