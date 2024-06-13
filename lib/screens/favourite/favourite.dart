import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/favourite/favourite_products.dart';
import '../../widgets/screen_title.dart';
import 'bloc/favourite_cubit.dart';

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
