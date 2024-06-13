import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product.dart';
import '../../screens/favourite/bloc/favourite_cubit.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    var state = context.watch<FavouriteCubit>().state;
    String key = product.id.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          context.read<FavouriteCubit>().onAddProduct(product);
        },
        child: Icon(
          color: state.products.containsKey(key) ? Colors.red : Colors.black,
          state.products.containsKey(key)
              ? Icons.favorite_sharp
              : Icons.favorite_border,
        ),
      ),
    );
  }
}
