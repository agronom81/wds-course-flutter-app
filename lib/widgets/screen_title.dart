import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Color.fromRGBO(24, 23, 37, 1.0),
        fontSize: 20,
        fontWeight: FontWeight.bold,
        letterSpacing: 0,
      ),
    );
  }
}
