import 'package:go_router/go_router.dart';
import 'package:wds_first_app/screens/app/auth_app.dart';

import '../screens/account.dart';
import '../screens/cart.dart';
import '../screens/explore.dart';
import '../screens/favourite.dart';
import '../screens/home.dart';
import '../screens/login.dart';
import '../screens/product.dart';
import 'tabs.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Login(),
    ),
    ShellRoute(
        builder: (context, state, child) => AuthApp(child: child),
        routes: [
          GoRoute(
            path: '/product/:productId',
            builder: (context, GoRouterState state) {
              final String id = state.pathParameters['productId']!;
              return Product(id: id);
            },
          ),
          ShellRoute(
              builder: (context, state, child) {
                return Tabs(
                  child: child,
                );
              },
              routes: [
                GoRoute(
                  path: '/shop',
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
        ]),
  ],
);
