import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'empty.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.action,
    this.cartSummary = '',
    this.isLoading = false,
    this.isInverse = false,
  });
  final String title;
  final void Function() action;
  final String cartSummary;
  final bool isLoading;
  final bool isInverse;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 67,
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: isInverse
              ? WidgetStateProperty.all<Color>(
                  const Color.fromRGBO(242, 243, 242, 1.0))
              : WidgetStateProperty.all<Color>(
                  const Color.fromRGBO(83, 177, 117, 1.0)),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(19.0),
            ),
          ),
        ),
        onPressed: action,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Center(
                child: isLoading
                    ? SizedBox(
                        height: 40,
                        width: 40,
                        child: Lottie.asset(
                          'animations/loader.json',
                        ),
                      )
                    : Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: isInverse
                              ? const Color.fromRGBO(83, 177, 117, 1.0)
                              : Colors.white,
                        ),
                      ),
              ),
            ),
            cartSummary != ''
                ? Positioned(
                    top: 23,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 1,
                        horizontal: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(72, 158, 103, 1),
                        border: Border.all(
                          color: const Color.fromRGBO(72, 158, 103, 1),
                        ),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Text(
                        '\$$cartSummary',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                : const Empty(),
            isInverse
                ? const Positioned(
                    top: 22,
                    left: 0,
                    child: Icon(
                      Icons.logout_outlined,
                      color: Color.fromRGBO(83, 177, 117, 1.0),
                    ),
                  )
                : const Empty(),
          ],
        ),
      ),
    );
  }
}
