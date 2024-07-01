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

  Future<HttpServerResponse> signup({
    required String email,
    required String password,
    required String name,
  }) {
    Map<String, dynamic> data = {
      'username': email,
      'password': password,
      'name': name
    };

    return api.sendPost(path: '/register', data: data);
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

  Future<HttpServerResponse> getProducts(
      {String catId = '', String tag = '', String query = ''}) async {
    Map<String, dynamic> data = {};

    if (catId != '') {
      data['cat_id'] = catId;
    }

    if (tag != '') {
      data['tag'] = tag;
    }

    if (query != '') {
      data['query'] = query;
    }

    return api.sendGet(path: '/products', data: data);
  }

  Future<HttpServerResponse> orderCreate(
      {required List<Map<String, int>> products}) async {
    Map<String, dynamic> data = {'products': products};
    return api.sendPost(path: '/order/create', data: data);
  }

  Future<HttpServerResponse> orders({
    int limit = 10,
    required int page,
  }) async {
    Map<String, dynamic> data = {
      'limit': limit,
      'page': page,
    };
    return api.sendGet(path: '/orders', data: data);
  }

  Future<HttpServerResponse> getUser() async {
    Map<String, dynamic> data = {};
    return api.sendGet(path: '/user', data: data);
  }
}
