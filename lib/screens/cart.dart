import 'package:flutter/material.dart';

import '../data/cart/cart_data.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cart',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            CartData.get(context).clear();
          },
          child: const Text("Clear"),
        ),
      ),
    );
  }
}
