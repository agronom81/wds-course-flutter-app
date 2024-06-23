import 'package:flutter/material.dart';

import 'empty.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.action,
    this.cartSummary = '',
  });
  final String title;
  final void Function() action;
  final String cartSummary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 67,
      child: FilledButton(
        style: ButtonStyle(
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
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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
          ],
        ),
      ),
    );
  }
}
