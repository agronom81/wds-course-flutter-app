import 'package:flutter/material.dart';

import '../../models/cart_product.dart';

class CartData extends InheritedWidget {
  List<CartProduct> products = [];

  CartData({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // return products.length != oldWidget.products.length;
    return false;
  }
}
