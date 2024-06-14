import 'package:flutter/material.dart';

import '../../common/app_settings.dart';
import '../../widgets/auth.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final AppSettings settings = AppSettings();

  @override
  Widget build(BuildContext context) {
    return Auth(
      typeForm: 'signup',
    );
  }
}
