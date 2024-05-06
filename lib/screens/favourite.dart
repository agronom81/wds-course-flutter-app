import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourite',
          textAlign: TextAlign.center,
        ),
      ),
      body: const Center(
        child: Text('Favourite'),
      ),
    );
  }
}
