import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PreloaderApp extends StatelessWidget {
  const PreloaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Center(
          child: Lottie.asset(
            'animations/preloader.json',
          ),
        ),
      ),
    );
  }
}
