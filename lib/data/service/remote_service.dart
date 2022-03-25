import 'package:breaking_bad_app/config/constants/resources.dart' as constants;
import 'package:breaking_bad_app/config/helpers/conncetivity_helper.dart';
import 'package:breaking_bad_app/models/base_models/base_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class APIService {
  final Dio _dio = Dio(BaseOptions(baseUrl: constants.baseUrl));

  Future<Either<dynamic, String>> get({
    required String path,
    Map<String, dynamic>? query,
    bool isAuth = false,
    required BaseModel model,
  }) async {
    final hasConnection = await hasNetworkConnection();
    if (!hasConnection) {
      return const Right("Internet Error");
    }

    if (isAuth) _setToken();
    final res = await _dio.get(path, queryParameters: query);
    if (res.data is List) {
      return Left(List<Map<String, dynamic>>.from(res.data)
          .map((e) => model.fromJson(e) )
          .toList());
    } else {
      return Left(model.fromJson(res.data));
    }
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
