import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../api/server_api.dart';
import '../../data/app_path.dart';
import '../../models/cart_product.dart';
import '../../screens/cart/bloc/cart_bloc.dart';
import '../../screens/cart/bloc/cart_event.dart';
import '../../screens/cart/bloc/cart_state.dart';
import '../custom_text.dart';
import '../primary_button.dart';
import 'checkout_text.dart';

class Checkout extends StatelessWidget {
  Checkout({super.key});

  final ServerApi api = ServerApi();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Checkout',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              IconButton(
                iconSize: 30,
                icon: const Icon(Icons.close),
                color: const Color.fromRGBO(24, 23, 37, 1),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                text: 'Total Cost',
                fontSize: 18,
                color: Color.fromRGBO(124, 124, 124, 1),
                fontWeight: FontWeight.bold,
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  double sum = state.getProductsSum();

                  return CustomText(
                    text: '\$${sum.toString()}',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 160),
          const Divider(
            color: Color.fromRGBO(226, 226, 226, 0.7),
            thickness: 1,
          ),
          const SizedBox(height: 20),
          const CheckoutText(),
          const SizedBox(height: 16),
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              List<CartProduct> products = state.products.values.toList();

              return PrimaryButton(
                title: 'Place Order',
                action: () {
                  _createOrder(context, products);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  _createOrder(
    BuildContext context,
    List<CartProduct> products,
  ) {
    List<Map<String, int>> productsMap = products.map((product) {
      return {
        'id': product.product.id,
        'count': product.count,
      };
    }).toList();

    api.orderCreate(products: productsMap).then((value) {
      if (value.isSuccess) {
        context.read<CartBloc>().add(
              CartClearEvent(),
            );
        context.go(AppPath.orderComplete);
      } else {
        _showOrderFailedDialog(context);
      }
    });
  }

  void _showOrderFailedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close),
                      color: const Color.fromRGBO(24, 23, 37, 1),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Lottie.asset(
                  'animations/orderError.json',
                  repeat: false,
                ),
                // Replace with your Lottie asset or image
                const SizedBox(height: 50),
                const CustomText(
                  text: 'Oops! Order Failed',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 20),
                const CustomText(
                  text: 'Something went terribly wrong.',
                  color: Color.fromRGBO(124, 124, 124, 1),
                ),
                const SizedBox(height: 60),
                PrimaryButton(
                  title: 'Please try again',
                  action: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => context.go(AppPath.shop),
                  child: const CustomText(
                    text: 'Back to home',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
