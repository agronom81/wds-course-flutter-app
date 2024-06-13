import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cart_bloc.dart';
import 'bloc/cart_event.dart';

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
            context.read<CartBloc>().add(CartClearEvent());
          },
          child: const Text("Clear"),
        ),
      ),
    );
  }
}
