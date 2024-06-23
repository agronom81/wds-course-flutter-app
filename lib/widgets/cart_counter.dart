import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/cart/bloc/cart_bloc.dart';
import '../screens/cart/bloc/cart_state.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            int sum = state.getProductsCount();

            return Text(
              "$sum",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
                height: 1,
              ),
            );
          },
        ),
      ),
    );
  }
}
