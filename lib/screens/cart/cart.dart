import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/core.dart';
import '../../ui/ui.dart';
import 'bloc/cart_bloc.dart';
import 'bloc/cart_state.dart';
import 'widgets/widgets.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ScreenTitle(
          title: 'My Cart',
        ),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          List<CartProduct> products = state.products.values.toList();

          return CartProducts(products: products);
        },
      ),
    );
  }
}
