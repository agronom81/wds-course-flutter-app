import 'package:flutter/material.dart';

class TermsService extends StatelessWidget {
  const TermsService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms of Service'),
      ),
      body: const Center(
        child: Text('Terms of Service'),
      ),
    );
  }
}
