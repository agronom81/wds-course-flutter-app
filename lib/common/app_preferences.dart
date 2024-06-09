import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/favourite_product.dart';

extension AppPreferences on SharedPreferences {
  static void setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return token;
  }

  static removeToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }

  static void setFavourite(Map<String, FavouriteProduct> products) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, String> jsonStringMap = products
        .map((key, value) => MapEntry(key, json.encode(value.toJson())));

    await prefs.setString('favourite', json.encode(jsonStringMap));
  }

  static Future<Map<String, FavouriteProduct>> getFavourite() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? products = prefs.getString('favourite');

    if (products == null) {
      return {};
    }

    Map<String, dynamic> decodedMap = json.decode(products);
    Map<String, FavouriteProduct> restoredMap = decodedMap.map((key, value) =>
        MapEntry(key, FavouriteProduct.fromJson(json.decode(value))));
    return restoredMap;
  }
}
