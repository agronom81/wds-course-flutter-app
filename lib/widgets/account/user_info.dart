import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/account/bloc/account_cubit.dart';
import '../../screens/account/bloc/account_state.dart';
import '../custom_text.dart';
import 'avatar.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            children: [
              const Avatar(),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: state.user.user_display_name,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text: state.user.user_email,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(124, 124, 124, 1),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
