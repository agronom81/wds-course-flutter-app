import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../data/app_path.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/primary_button.dart';

class OrderComplete extends StatelessWidget {
  const OrderComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(25),
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('images/orderCompleteBg.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                SizedBox(
                  width: 270,
                  child: Lottie.asset(
                    'animations/lottieSuccess.json',
                    repeat: false,
                  ),
                ),
              ],
            ),
            const Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: 'Your order has been\n accepted',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text:
                      'Your items has been placed and is on\nit’s way to being processed',
                  color: Color.fromRGBO(124, 124, 124, 1),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 8),
                PrimaryButton(
                  title: 'Track order',
                  action: () {
                    context.go(AppPath.orders);
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
          ],
        ),
      ),
    );
  }
}
