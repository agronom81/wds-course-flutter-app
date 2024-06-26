import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/primary_button.dart';

class Welcome extends StatefulWidget {
  const Welcome({
    super.key,
    required this.action,
  });

  final void Function() action;

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late bool _visible = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('images/welcomeBg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 55,
                  child: SvgPicture.asset(
                    'icons/carrotWhite.svg',
                    width: 47,
                    height: 55,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Welcome\nto our store',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0,
                  ),
                ),
                const Text(
                  'Get your groceries in as fast as one hour',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(252, 252, 252, 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                PrimaryButton(title: 'Get Started', action: widget.action),
                const SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
