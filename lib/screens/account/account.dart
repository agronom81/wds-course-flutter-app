import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/core.dart';
import '../../ui/ui.dart';
import '../login/bloc/login_cubit.dart';
import 'bloc/account_cubit.dart';
import 'bloc/account_state.dart';
import 'widgets/widgets.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AccountCubit, AccountState>(
        listener: (context, state) {
          if (state.user.id == '') {
            _logout(context);
          }
        },
        child: BlocBuilder<AccountCubit, AccountState>(
          builder: (context, state) {
            return state.isLoading
                ? const Loader()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          UserInfo(),
                          SizedBox(height: 30),
                          Divider(),
                          OrdersTile(),
                          Divider(),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: PrimaryButton(
                          title: 'Logout',
                          isInverse: true,
                          action: () {
                            _logout(context);
                          },
                        ),
                      ),
                    ],
                  );
          },
        ),
      ),
    );
  }

  _logout(BuildContext context) {
    context.read<LoginCubit>().logout();
    context.go(AppPath.login);
  }

  _getUser() {
    context.read<AccountCubit>().getUser();
  }
}
