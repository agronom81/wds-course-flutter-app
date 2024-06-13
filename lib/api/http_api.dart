import 'package:dio/dio.dart';

import '../common/app_settings.dart';
import '../common/utils.dart';
import 'http_server_response.dart';

class HttpApi {
  late Dio dio;
  final AppSettings settings = AppSettings();

  HttpApi({required String server}) {
    dio = Dio(
      BaseOptions(
        baseUrl: server,
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          String? token = await settings.getToken() ?? '';

          if (token != '') {
            options.headers['Authorization'] = 'Bearer $token';
          }

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

    int code = response.statusCode ?? 200;
    bool status = getValue(data, 'status') ?? false;
    bool success = code >= 200 && code < 300 && status;

    return HttpServerResponse(
        code: code,
        message: getValue(data, 'message') ?? 'Success',
        data: getValue(data, 'data'),
        isSuccess: success);
  }

  _mapError(DioException e) {
    dynamic data = e.response?.data ?? '';
    String message = e.message ?? 'Error from server';
    return HttpServerResponse(
        code: e.response?.statusCode ?? -1,
        message: getValue(data, 'message') ?? message,
        data: e.response?.data ?? '',
        isSuccess: false);
  }
}
