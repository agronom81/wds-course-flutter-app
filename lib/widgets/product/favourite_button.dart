import 'package:flutter/material.dart';

import '../../data/favourite/favourite_data.dart';
import '../../models/product.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    super.key,
    required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    FavouriteData data = FavouriteData.of(context);
    String key = product.id.toString();

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          FavouriteData.get(context).addProduct(product);
        },
        child: Icon(
          color: data.products.containsKey(key) ? Colors.red : Colors.black,
          data.products.containsKey(key)
              ? Icons.favorite_sharp
              : Icons.favorite_border,
        ),
      ),
    );
  }
}
