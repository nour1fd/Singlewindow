import 'package:dio/dio.dart';
import 'package:untitled1/const.dart';

class UserWeb {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "http://192.168.43.5:80/api/",
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        }));
  }

  static Future<Response> getDtat({
    required String url,
    Map<String, dynamic>? query,
    String? Token
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $Token',
      'Content-Type':'application/json',

    };
    return await dio.get(url, queryParameters: query);

  }

  static Future<Response<dynamic>> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String,dynamic>? query,
  }) async {
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return dio.post(url, data: data,
        queryParameters: query
    );
  }

  static Future<Response> PutData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String Lang = 'en',
    String? Token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': Lang,
      'Authorization': '$Token',
    };
    return await dio.put(url, queryParameters: query, data: data);
  }
  static Future<Response> deleteData ({
    required String url,

  })async
  {

    return await dio.delete(url);
  }


}
