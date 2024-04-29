import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Color.fromRGBO(24, 23, 37, 1.0),
          fontWeight: FontWeight.w600,
          fontSize: 24),
    );
  }
}
