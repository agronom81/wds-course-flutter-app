import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/app_color.dart';
import '../../data/app_path.dart';

class SignupText extends StatelessWidget {
  const SignupText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
              text: 'By continuing you agree to our',
              style: const TextStyle(
                color: Color.fromRGBO(24, 23, 37, 1),
                fontWeight: FontWeight.w600,
                fontSize: 14,
                height: 1.5,
              ),
              children: [
                const TextSpan(
                  text: ' ',
                ),
                TextSpan(
                  text: 'Terms of Service',
                  style: const TextStyle(
                    color: AppColor.accentColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.push(AppPath.termsService);
                    },
                ),
                const TextSpan(
                  text: ' and ',
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: const TextStyle(
                    color: AppColor.accentColor,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.push(AppPath.privacy);
                    },
                )
              ]),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}