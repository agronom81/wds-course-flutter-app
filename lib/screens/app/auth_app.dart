import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api/server_api.dart';
import '../../common/app_settings.dart';
import '../cart/bloc/cart_bloc.dart';
import '../favourite/bloc/favourite_cubit.dart';
import '../home/bloc/home_cubit.dart';
import 'init_app.dart';

class AuthApp extends StatelessWidget {
  const AuthApp({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return HomeCubit(serverApi: context.read<ServerApi>());
        }),
        BlocProvider(create: (context) {
          return CartBloc();
        }),
        BlocProvider(create: (context) {
          return FavouriteCubit(settings: context.read<AppSettings>());
        }),
      ],
      child: InitApp(
        child: child,
      ),
    );
  }
}