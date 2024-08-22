import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../data/data.dart';


class CartContext extends StatefulWidget {
  const CartContext({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<CartContext> createState() => _CartContextState();
}

class _CartContextState extends State<CartContext> {
  Map<String, CartProduct> products = {};

  @override
  Widget build(BuildContext context) {
    return CartData(
      products: products.values.toList(),
      addProduct: _onAddProduct,
      clear: _onClear,
      child: widget.child,
    );
  }

  _onAddProduct(ProductShort product) {
    String key = product.id.toString();
    if (products.containsKey(key)) {
      setState(() {
        products[key] = CartProduct(
          product: product,
          count: products[key]!.count + 1,
        );
      });
    } else {
      setState(() {
        products[key] = CartProduct(
          product: product,
          count: 1,
        );
      });
    }
  }

  _onClear() {
    setState(() {
      products = {};
    });
  }
}
