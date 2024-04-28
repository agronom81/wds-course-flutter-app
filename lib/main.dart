import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/page_2.dart';
import 'screens/page_3.dart';
import 'screens/home.dart';
import 'screens/tab_page.dart';

void main() {
  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    ShellRoute(
        builder: (context, state, child) {
          return TabPage(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/page3',
            name: 'page3',
            builder: (context, state) => const Page3(),
          ),
          GoRoute(
            path: '/page2',
            name: 'page2',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: const Page2(
                  param: '',
                ),
                transitionDuration: const Duration(seconds: 1),
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
              );
            },
          ),
        ]),
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routerConfig: _router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
