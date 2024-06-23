import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart_product.dart';
import '../../screens/cart/bloc/cart_bloc.dart';
import '../../screens/cart/bloc/cart_state.dart';
import '../primary_button.dart';
import 'cart_product_card.dart';

class CartProducts extends StatelessWidget {
  const CartProducts({
    super.key,
    required this.products,
  });

  final List<CartProduct> products;

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text('The cart is empty'),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: Color.fromRGBO(226, 226, 226, 1),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return CartProductCard(
                  cartProduct: products[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 1,
                color: Color.fromRGBO(226, 226, 226, 1),
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: Color.fromRGBO(226, 226, 226, 1),
          ),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              double sum = state.getProductsSum();

              return Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: PrimaryButton(
                  title: 'Go to Checkout',
                  cartSummary: sum.toString(),
                  action: () {},
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
