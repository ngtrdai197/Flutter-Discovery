import 'package:dio/dio.dart';

import '../api_constants.dart';

class NetworkUtil {
  Dio _dio;
  final token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im5ndXllbmRhaSIsInJvbGUiOiJhZG1pbiIsImlkIjoiNWQ3NTE3ZTYzYjNlZmMzNTQwZGY2MzMwIiwiaWF0IjoxNTcxOTAyNzUxLCJleHAiOjE1NzE5MDYzNTF9.Ox-UoDm4OHDbJHNM_ickVHKmXO6gyUEPYEZ1DhmUj18';
  NetworkUtil() {
    ///Create Dio Object using baseOptions set receiveTimeout,connectTimeout
    BaseOptions options = BaseOptions(
        receiveTimeout: 5000,
        connectTimeout: 5000,
        headers: {'x-access-token': token});
    options.baseUrl = ApiConstants.BASE_URL;
    _dio = Dio(options);
    // _dio.interceptors.add(LogInterceptor()); // log response the server return;
  }

  ///used for calling Get Request
  Future<Response> get(String url) async {
    Response response =
        await _dio.get(url, options: Options(responseType: ResponseType.json));
    return response;
  }

  ///used for calling post Request
  Future<Response> post(String url, Map<String, String> params) async {
    Response response = await _dio.post(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }
}
