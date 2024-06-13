import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/server_api.dart';
import 'common/app_settings.dart';
import 'common/router.dart';
import 'common/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => ServerApi()),
        RepositoryProvider(create: (_) => AppSettings()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerConfig: router,
        theme: theme,
      ),
    );
  }
}
