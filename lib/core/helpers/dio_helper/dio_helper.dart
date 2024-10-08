import 'package:dio/dio.dart';

import 'package:ecomerce/core/constants/end_point.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(baseUrl: EndPoint.baseUrl));
  }

  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? mapData,
    Map<String, dynamic>? mapQuery,
  }) {
    try {
      var response =
          dio.post(endPoint, data: mapData, queryParameters: mapQuery);
      return response;
    } on DioException {
      rethrow;
    }
  }
  static Future<Response> getData({
    required String endPoint,
    Map<String,dynamic>?mapData,
    Map<String,dynamic>?mapQuery,
}){
    try{
      var response=
          dio.get(endPoint,data: mapData,queryParameters: mapQuery);
      return response;
    }on DioException{
      rethrow;
    }
  }
}
