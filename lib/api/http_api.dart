import 'package:dio/dio.dart';

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

  Future<HttpServerResponse> sendGet({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      var response = await dio.post(
        path,
        data: data,
      );
      return _mapSuccess(response);
    } on DioException catch (e) {
      return _mapError(e);
    }
  }

  _mapSuccess(Response response) {
    print(response);
    return HttpServerResponse(
      code: response.statusCode ?? 200,
      message: 'Success',
      data: response.data,
    );
  }

  _mapError(DioException e) {
    return HttpServerResponse(
      code: e.response?.statusCode ?? -1,
      message: e.message ?? 'Error from server',
      data: e.response?.data ?? '',
    );
  }
}
