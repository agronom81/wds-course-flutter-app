import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/cart_product.dart';
import '../../models/product_short.dart';

class CartData extends InheritedWidget {
  final List<CartProduct> products;
  final Function(ProductShort) addProduct;
  final Function() clear;

  const CartData({
    super.key,
    required super.child,
    required this.products,
    required this.addProduct,
    required this.clear,
  });

  @override
  bool updateShouldNotify(covariant CartData oldWidget) {
    return !listEquals(oldWidget.products, products);
  }

  static CartData of(BuildContext context) {
    CartData? data = context.dependOnInheritedWidgetOfExactType<CartData>();
    assert(data != null, 'No CartData in context');
    return data!;
  }

  static CartData get(BuildContext context) {
    CartData? data = context.getInheritedWidgetOfExactType<CartData>();
    assert(data != null, 'No CartData in context');
    return data!;
  }
}
