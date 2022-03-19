import 'package:breaking_bad_app/config/constants/resources.dart' as constants;
import 'package:dio/dio.dart';

class APIService {
  final Dio _dio = Dio(BaseOptions(baseUrl: constants.baseUrl));

  Future<Response> get({
    required String path,
    Map<String, dynamic>? query,
    bool isAuth = false,
  }) async {
    if (isAuth) _setToken();
    return await _dio.get(path, queryParameters: query);
  }

  Future<Response> post({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isAuth = false,
  }) async {
    if (isAuth) _setToken();
    return await _dio.post(path, queryParameters: query, data: body);
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    bool isAuth = false,
  }) async {
    if (isAuth) _setToken();
    return await _dio.put(path, queryParameters: query, data: body);
  }

  void _setToken() {
    //TODO get token from cahced
    String token = "";
    _dio.options.headers["token"] = token;
  }
}
