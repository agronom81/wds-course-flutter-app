import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/ui.dart';
import 'bloc/favourite_cubit.dart';
import 'widgets/widgets.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<FavouriteCubit>().state;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ScreenTitle(
          title: 'Favourite',
        ),
      ),
      body: FavouriteProducts(products: state.products.values.toList()),
    );
  }
}
