import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_extra.dart';
import '../../models/product_short.dart';
import '../../screens/cart/bloc/cart_bloc.dart';
import '../../screens/cart/bloc/cart_event.dart';
import '../product_card.dart';
import '../section_title.dart';

class HomeProducts extends StatelessWidget {
  const HomeProducts({
    super.key,
    required this.products,
    required this.blockTitle,
    required this.routeName,
    required this.extra,
  });

  final List<ProductShort> products;
  final String blockTitle;
  final String routeName;
  final ProductExtra extra;

  @override
  Widget build(BuildContext context) {
    void addProduct(ProductShort product) async {
      context.read<CartBloc>().add(CartAddEvent(product: product));
    }

    return Column(
      children: [
        SectionTitle(
          title: blockTitle,
          routeName: routeName,
          extra: extra,
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 15,
                width: 15,
              );
            },
            padding: const EdgeInsets.only(right: 25, left: 25),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
                action: addProduct,
              );
            },
          ),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
