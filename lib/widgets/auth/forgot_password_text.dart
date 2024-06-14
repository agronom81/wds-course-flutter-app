import 'package:flutter/material.dart';

import '../custom_text.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {},
        child: const CustomText(
          text: 'Forgot Password',
          fontSize: 14,
        ),
      ),
    );
  }
}
