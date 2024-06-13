import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'login/bloc/login_cubit.dart';

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
        child: FilledButton(
          onPressed: () {
            _logout(context);
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }

  _logout(BuildContext context) {
    context.read<LoginCubit>().logout();
    context.go('/');
  }
}
