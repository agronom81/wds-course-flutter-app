import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/server_api.dart';
import '../../common/app_settings.dart';
import '../login/bloc/login_cubit.dart';

class App extends StatelessWidget {
  const App({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return LoginCubit(
            serverApi: context.read<ServerApi>(),
            settings: context.read<AppSettings>(),
          );
        })
      ],
      child: child,
    );
  }
}
