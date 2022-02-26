import 'package:breaking_bad_app/config/constants/resources.dart' as constants;
import 'package:dio/dio.dart';

class APIService {
  final Dio _dio = Dio(BaseOptions(baseUrl: constants.baseUrl));

  Future<dynamic> get(
      {required String path, Map<String, dynamic>? query}) async {
    final res = await _dio.get(path, queryParameters: query);
    return res.data;
  }

  Future<dynamic> post(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? body}) async {
    final res = await _dio.post(path, queryParameters: query, data: body);
    return res.data;
  }

  Future<dynamic> put(
      {required String path,
      Map<String, dynamic>? query,
      Map<String, dynamic>? body}) async {
    final res = await _dio.put(path, queryParameters: query, data: body);
    return res.data;
  }
}
