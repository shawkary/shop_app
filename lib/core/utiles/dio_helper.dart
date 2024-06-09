import 'package:dio/dio.dart';

class DioHelper
{
  DioHelper(this.dio);
  final Dio dio;

  final _baseUrl = 'https://student.valuxapps.com/api/';
  
  Future<Map<String, dynamic>> postData({
    required String endPoint,
    query,
  })async {
    var response = await dio.post('$_baseUrl$endPoint', queryParameters: query);
    return response.data;
  }

  Future<Map<String, dynamic>> getData({
    required String endPoint,
  })async {
    var response = await dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}