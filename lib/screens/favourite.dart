import 'package:flutter/material.dart';

import '../data/favourite/favourite_data.dart';
import '../widgets/favourite/favourite_products.dart';
import '../widgets/screen_title.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    FavouriteData data = FavouriteData.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const ScreenTitle(
          title: 'Favourite',
        ),
      ),
      body: FavouriteProducts(products: data.products.values.toList()),
    );
  }
}
