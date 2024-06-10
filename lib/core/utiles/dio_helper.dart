import 'package:dio/dio.dart';

class DioHelper
{
  DioHelper(this._dio);
  final Dio _dio;

  final _baseUrl = 'https://student.valuxapps.com/api/';
  
  Future<Response> postData({
    required String endPoint,
    query,
    required Map<String, dynamic> data,
  })async {
    return await _dio.post('$_baseUrl$endPoint', queryParameters: query, data: data);
  }

  Future<Map<String, dynamic>> getData({
    required String endPoint,
  })async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}