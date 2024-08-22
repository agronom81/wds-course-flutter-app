import 'package:flutter/material.dart';

import '../../core/app_settings.dart';
import 'widgets/auth.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final AppSettings settings = AppSettings();

  @override
  Widget build(BuildContext context) {
    return Auth(
      typeForm: 'login',
    );
  }
}
