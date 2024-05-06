import 'package:go_router/go_router.dart';

import '../screens/account.dart';
import '../screens/cart.dart';
import '../screens/explore.dart';
import '../screens/favourite.dart';
import '../screens/home.dart';
import 'tabs.dart';

final router = GoRouter(
  routes: [
    ShellRoute(
        builder: (context, state, child) {
          return Tabs(
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'shop',
            builder: (context, state) => const Home(),
          ),
          GoRoute(
            path: '/explore',
            name: 'explore',
            builder: (context, state) => const Explore(),
          ),
          GoRoute(
            path: '/cart',
            name: 'cart',
            builder: (context, state) => const Cart(),
          ),
          GoRoute(
            path: '/favourite',
            name: 'favourite',
            builder: (context, state) => const Favourite(),
          ),
          GoRoute(
            path: '/account',
            name: 'account',
            builder: (context, state) => const Account(),
          ),
        ]),
    GoRoute(
      path: '/',
      builder: (context, state) => const Home(),
    ),
  ],
);
