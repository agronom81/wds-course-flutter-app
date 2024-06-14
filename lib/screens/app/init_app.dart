import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../favourite/bloc/favourite_cubit.dart';

class InitApp extends StatefulWidget {
  const InitApp({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<InitApp> createState() => _InitAppState();
}

class _InitAppState extends State<InitApp> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteCubit>().loadFavourites();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
