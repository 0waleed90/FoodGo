import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = 'https://dummyjson.com/';

  ApiService(this._dio) {
    _dio.options.connectTimeout = const Duration(seconds: 15);
    _dio.options.receiveTimeout = const Duration(seconds: 15);
  }

  Future<dynamic> getResponse(String endPoint) async {
    var response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
