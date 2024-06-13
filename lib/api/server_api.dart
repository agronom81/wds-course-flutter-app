import 'http_api.dart';
import 'http_server_response.dart';

class ServerApi {
  static final ServerApi _instance = ServerApi._internal();

  factory ServerApi() {
    return _instance;
  }

  ServerApi._internal();

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

  Future<HttpServerResponse> getCategories() async {
    Map<String, dynamic> data = {};
    return api.sendGet(path: '/product/categories', data: data);
  }

  Future<HttpServerResponse> getProduct({required dynamic id}) async {
    Map<String, dynamic> data = {'id': id};
    return api.sendGet(path: '/product', data: data);
  }

  Future<HttpServerResponse> getProducts() async {
    Map<String, dynamic> data = {};
    return api.sendGet(path: '/products', data: data);
  }
}
