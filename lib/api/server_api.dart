import 'package:wds_first_app/common/app_preferences.dart';

import 'http_api.dart';
import 'http_server_response.dart';

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

  Future<HttpServerResponse> getHome() async {
    Map<String, dynamic> data = {};
    return api.sendGet(path: '/home', data: data);
  }
}
