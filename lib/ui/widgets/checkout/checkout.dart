import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../api/server_api.dart';
import '../../../core/core.dart';
import '../../../screens/cart/bloc/cart_bloc.dart';
import '../../../screens/cart/bloc/cart_event.dart';
import '../../../screens/cart/bloc/cart_state.dart';
import '../../../screens/orders/bloc/orders_cubit.dart';
import '../custom_text.dart';
import '../primary_button.dart';
import 'checkout_text.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final ServerApi api = ServerApi();
  late bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
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
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    SizedBox(height: 16),
                    Divider(
                      color: Color.fromRGBO(226, 226, 226, 0.7),
                      thickness: 1,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
                Column(
                  children: [
                    const CheckoutText(),
                    const SizedBox(height: 16),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        List<CartProduct> products =
                            state.products.values.toList();

                        return PrimaryButton(
                          isLoading: isLoading,
                          title: 'Place Order',
                          action: () {
                            _createOrder(context, products);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
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
    setState(() {
      isLoading = true;
    });
    api.orderCreate(products: productsMap).then((value) {
      if (value.isSuccess) {
        if (context.mounted) {
          context.read<CartBloc>().add(
                CartClearEvent(),
              );
          context.read<OrdersCubit>().clearState();
          context.go(AppPath.orderComplete);
        }
      } else {
        if (context.mounted) {
          _showOrderFailedDialog(context);
        }
      }
      setState(() {
        isLoading = false;
      });
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
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
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
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Lottie.asset(
                        'animations/orderError.json',
                        repeat: false,
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
                const Column(
                  children: [
                    // SizedBox(height: 50),
                    CustomText(
                      textAlign: TextAlign.center,
                      text: 'Oops! Order Failed',
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 16),
                    CustomText(
                      textAlign: TextAlign.center,
                      text: 'Something went terribly wrong.',
                      color: Color.fromRGBO(124, 124, 124, 1),
                    ),
                    SizedBox(height: 60),
                  ],
                ),
                Column(
                  children: [
                    PrimaryButton(
                      title: 'Please try again',
                      action: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.go(AppPath.shop);
                      },
                      child: const CustomText(
                        text: 'Back to home',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
