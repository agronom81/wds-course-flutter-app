import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/server_api.dart';
import 'core/core.dart';
import 'router/router.dart';
import 'ui/theme/theme.dart';

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
        title: 'Flutter Demo Shop',
        routerConfig: router,
        theme: theme,
      ),
    );
  }
}
