import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../api/server_api.dart';
import '../../common/app_settings.dart';
import '../../data/app_path.dart';
import '../login/bloc/login_cubit.dart';
import '../welcome.dart';

class App extends StatefulWidget {
  const App({
    super.key,
    required this.child,
    required this.settings,
  });

  final AppSettings settings;
  final Widget child;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isWelcome = true;

  @override
  void initState() {
    super.initState();
    _checkIsWelcome();
  }

  @override
  Widget build(BuildContext context) {
    if (isWelcome) {
      return Welcome(
        action: getStarted,
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return LoginCubit(
            serverApi: context.read<ServerApi>(),
            settings: context.read<AppSettings>(),
          );
        })
      ],
      child: widget.child,
    );
  }

  void getStarted() {
    widget.settings.setIsWelcome();
    setState(() {
      isWelcome = false;
    });
  }

  Future<void> _checkToken() async {
    String? token = await widget.settings.getToken();

    if (token != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(AppPath.shop);
      });
    }
  }

  Future<void> _checkIsWelcome() async {
    bool welcome = await widget.settings.getIsWelcome();

    setState(() {
      isWelcome = welcome;
    });

    if (!welcome) {
      _checkToken();
    }
  }
}
