import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/app_preferences.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Account',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            AppPreferences.removeToken();
            context.go('/');
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
