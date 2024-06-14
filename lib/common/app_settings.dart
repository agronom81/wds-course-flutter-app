import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/favourite_product.dart';

class AppSettings {
  static final AppSettings _instance = AppSettings._internal();

  AppSettings._internal();

  factory AppSettings() {
    return _instance;
  }

  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> setToken(String token) async {
    final SharedPreferences prefs = await _getPrefs();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await _getPrefs();
    return prefs.getString('token');
  }

  Future<void> removeToken() async {
    final SharedPreferences prefs = await _getPrefs();
    await prefs.remove('token');
  }

  Future<void> setFavourite(Map<String, FavouriteProduct> products) async {
    final SharedPreferences prefs = await _getPrefs();
    Map<String, String> jsonStringMap = products
        .map((key, value) => MapEntry(key, json.encode(value.toJson())));

    await prefs.setString('favourite', json.encode(jsonStringMap));
  }

  Future<Map<String, FavouriteProduct>> getFavourite() async {
    final SharedPreferences prefs = await _getPrefs();
    final String? products = prefs.getString('favourite');

    if (products == null) {
      return {};
    }

    Map<String, dynamic> decodedMap = json.decode(products);
    Map<String, FavouriteProduct> restoredMap = decodedMap.map((key, value) =>
        MapEntry(key, FavouriteProduct.fromJson(json.decode(value))));
    return restoredMap;
  }

  Future<void> setIsWelcome() async {
    final SharedPreferences prefs = await _getPrefs();
    await prefs.setBool('isWelcome', false);
  }

  Future<bool> getIsWelcome() async {
    final SharedPreferences prefs = await _getPrefs();
    return prefs.getBool('isWelcome') ?? true;
  }
}
