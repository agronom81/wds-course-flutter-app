import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wds_first_app/widgets/cart/cart_products.dart';

import '../../models/cart_product.dart';
import '../../widgets/screen_title.dart';
import 'bloc/cart_bloc.dart';
import 'bloc/cart_state.dart';

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
