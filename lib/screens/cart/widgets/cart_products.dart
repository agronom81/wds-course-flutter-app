import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../ui/ui.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';
import 'widgets.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({
    super.key,
    required this.products,
  });

  final List<CartProduct> products;

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  @override
  Widget build(BuildContext context) {
    if (widget.products.isEmpty) {
      return const Center(
        child: Text('The cart is empty'),
      );
    }

    return SizedBox(
      height: double.infinity,
      child: Stack(
        children: [
          SingleChildScrollView(
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
                    itemCount: widget.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CartProductCard(
                        cartProduct: widget.products[index],
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
                  height: 100,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: BlocBuilder<CartBloc, CartState>(
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
                    action: _goToCheckout,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _goToCheckout() {
    context.read<CartBloc>().add(
          CartCheckoutEvent(
            isOpen: true,
          ),
        );
  }
}
