import 'package:flutter/material.dart';

import '../../models/product_short.dart';
import '../product_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
    required this.products,
    required this.action,
  });

  final List<ProductShort> products;
  final void Function(ProductShort value) action;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: 15.0,
        mainAxisExtent: 250,
      ),
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(
          product: products[index],
          action: action,
        );
      },
    );
  }
}
