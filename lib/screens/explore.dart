import 'package:flutter/material.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Find Products',
          textAlign: TextAlign.center,
        ),
      ),
      body: const Center(
        child: Text('EXPLORE'),
      ),
    );
  }
}
