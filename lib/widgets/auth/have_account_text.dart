import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/app_color.dart';
import '../../data/app_path.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    super.key,
    required this.isLogin,
    required this.isSignup,
  });

  final bool isLogin;
  final bool isSignup;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
            text: isLogin
                ? 'Don\'t have an account?'
                : 'Already have an account?',
            style: const TextStyle(
              color: Color.fromRGBO(24, 23, 37, 1),
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            children: [
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: isLogin ? 'Signup' : 'Login',
                style: const TextStyle(
                  color: AppColor.accentColor,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    if (isLogin) {
                      context.go(AppPath.signup);
                    }

                    if (isSignup) {
                      context.go(AppPath.login);
                    }
                  },
              )
            ]),
      ),
    );
  }
}
