import 'package:dio/dio.dart';

import '../common/app_preferences.dart';
import '../common/utils.dart';
import 'http_server_response.dart';

class HttpApi {
  late Dio dio;

  HttpApi({required String server}) {
    dio = Dio(
      BaseOptions(
        baseUrl: server,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await AppPreferences.getToken() ?? '';
          options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  Future<HttpServerResponse> sendPost(
      {required String path,
      required Map<String, dynamic> data,
      Map<String, dynamic>? header}) async {
    try {
      var response =
          await dio.post(path, data: data, options: Options(headers: header));
      return _mapSuccess(response);
    } on DioException catch (e) {
      return _mapError(e);
    }
  }

  Future<HttpServerResponse> sendGet(
      {required String path,
      required Map<String, dynamic> data,
      Map<String, dynamic>? header}) async {
    try {
      var response =
          await dio.get(path, data: data, options: Options(headers: header));
      return _mapSuccess(response);
    } on DioException catch (e) {
      return _mapError(e);
    }
  }

  _mapSuccess(Response response) {
    dynamic data = response.data ?? '';
    return HttpServerResponse(
      code: response.statusCode ?? 200,
      message: 'Success',
      data: getValue(data, 'data'),
      status: getValue(data, 'status') ?? false,
    );
  }

  _mapError(DioException e) {
    dynamic data = e.response?.data ?? '';
    String message = e.message ?? 'Error from server';
    return HttpServerResponse(
        code: e.response?.statusCode ?? -1,
        message: getValue(data, 'message') ?? message,
        data: e.response?.data ?? '',
        status: getValue(data, 'status') ?? false);
  }
}
