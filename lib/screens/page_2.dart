import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Page2 extends StatelessWidget {
  final String param;
  const Page2({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2 $param'),
      ),
      body: Center(
          child: Column(
        children: [
          FilledButton(
            onPressed: () {
              context.pop('Hi from page 2');
            },
            child: const Text('BACK'),
          ),
          FilledButton(
            onPressed: () {
              context.go('/');
            },
            child: const Text('GO 1'),
          ),
        ],
      )),
    );
  }
}
