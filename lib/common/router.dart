import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../data/app_path.dart';
import '../models/product_extra.dart';
import '../screens/account.dart';
import '../screens/app/app.dart';
import '../screens/app/auth_app.dart';
import '../screens/cart/cart.dart';
import '../screens/explore.dart';
import '../screens/favourite/favourite.dart';
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/privacy_poplicy.dart';
import '../screens/product.dart';
import '../screens/products/products.dart';
import '../screens/signup.dart';
import '../screens/terms_service.dart';
import 'app_settings.dart';
import 'tabs.dart';

final router = GoRouter(
  initialLocation: AppPath.login,
  routes: [
    ShellRoute(
      builder: (context, state, child) => App(
        settings: context.read<AppSettings>(),
        child: child,
      ),
      routes: [
        GoRoute(
          path: AppPath.login,
          builder: (context, state) => Login(),
        ),
        GoRoute(
          path: AppPath.signup,
          builder: (context, state) => Signup(),
        ),
        GoRoute(
          path: AppPath.privacy,
          builder: (context, state) => const PrivacyPolicy(),
        ),
        GoRoute(
          path: AppPath.termsService,
          builder: (context, state) => const TermsService(),
        ),
        GoRoute(
          path: AppPath.signup,
          builder: (context, state) => Signup(),
        ),
        ShellRoute(
            builder: (context, state, child) => AuthApp(child: child),
            routes: [
              GoRoute(
                path: AppPath.product,
                builder: (context, GoRouterState state) {
                  final String id = state.pathParameters['productId']!;
                  return Product(id: id);
                },
              ),
              GoRoute(
                path: AppPath.products,
                builder: (context, GoRouterState state) {
                  return Products(
                    extra: state.extra as ProductExtra?,
                  );
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
                      path: AppPath.shop,
                      builder: (context, state) => Home(),
                    ),
                    GoRoute(
                      path: AppPath.explore,
                      builder: (context, state) => const Explore(),
                    ),
                    GoRoute(
                      path: AppPath.cart,
                      builder: (context, state) => const Cart(),
                    ),
                    GoRoute(
                      path: AppPath.favourite,
                      builder: (context, state) => const Favourite(),
                    ),
                    GoRoute(
                      path: AppPath.account,
                      builder: (context, state) => const Account(),
                    ),
                  ]),
            ]),
      ],
    ),
  ],
);
