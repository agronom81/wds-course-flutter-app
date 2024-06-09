import 'package:flutter/material.dart';

import '../../models/favourite_product.dart';
import '../../models/product.dart';

class FavouriteData extends InheritedWidget {
  final Map<String, FavouriteProduct> products;
  final Function(Product) addProduct;
  final Function() clear;

  const FavouriteData({
    super.key,
    required super.child,
    required this.products,
    required this.addProduct,
    required this.clear,
  });

  @override
  bool updateShouldNotify(covariant FavouriteData oldWidget) {
    return true;
  }

  static FavouriteData of(BuildContext context) {
    FavouriteData? data =
        context.dependOnInheritedWidgetOfExactType<FavouriteData>();
    assert(data != null, 'No FavoriteData in context');

    return data!;
  }

  static FavouriteData get(BuildContext context) {
    FavouriteData? data =
        context.getInheritedWidgetOfExactType<FavouriteData>();
    assert(data != null, 'No CartData in context');
    return data!;
  }
}
