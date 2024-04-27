import 'package:dio/dio.dart';
import 'package:wds_first_app/api/http_api.dart';
import 'package:wds_first_app/api/http_server_response.dart';

class ServerApi {
  HttpApi api =
      HttpApi(server: 'https://it-flutter.wdscode.guru/wp-json/flutter/v1');

  Future<HttpServerResponse> login({
    required String login,
    required String password,
  }) {
    Map<String, dynamic> data = {'username': login, 'password': password};

    return api.sendPost(path: '/login', data: data);
  }
}
