import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../data/app_path.dart';
import '../../widgets/account/orders_tile.dart';
import '../../widgets/account/user_info.dart';
import '../../widgets/loader.dart';
import '../../widgets/primary_button.dart';
import '../login/bloc/login_cubit.dart';
import 'bloc/account_cubit.dart';
import 'bloc/account_state.dart';

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
                      Column(
                        children: [
                          UserInfo(
                            user: state.user,
                          ),
                          const SizedBox(height: 30),
                          const Divider(),
                          const OrdersTile(),
                          const Divider(),
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
