import 'package:flutter/material.dart';

import '../data/cart/cart_data.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({super.key});

  @override
  Widget build(BuildContext context) {
    CartData data = CartData.of(context);
    int sum = 0;

    for (var product in data.products) {
      sum += product.count;
    }

    return Container(
      width: 12,
      height: 12,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "$sum",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 9,
            height: 1,
          ),
        ),
      ),
    );
  }
}
