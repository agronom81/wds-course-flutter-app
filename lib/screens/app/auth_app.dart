import 'package:flutter/material.dart';

import '../../widgets/context/cart_context.dart';
import '../../widgets/context/favourite_context.dart';

class AuthApp extends StatelessWidget {
  const AuthApp({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CartContext(
      child: FavouriteContext(
        child: child,
      ),
    );
  }
}
