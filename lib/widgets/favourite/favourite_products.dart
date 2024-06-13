import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../models/favourite_product.dart';
import '../../models/product_short.dart';
import '../../screens/cart/bloc/cart_bloc.dart';
import '../../screens/cart/bloc/cart_event.dart';
import '../../screens/favourite/bloc/favourite_cubit.dart';
import '../primary_button.dart';
import 'favourite_product_card.dart';

class FavouriteProducts extends StatelessWidget {
  FavouriteProducts({
    super.key,
    required this.products,
  });
  final List<FavouriteProduct> products;
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text('No Favourite Products'),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const Divider(
            height: 1,
            color: Color.fromRGBO(226, 226, 226, 1),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return FavouriteProductCard(
                  product: products[index].product,
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                height: 1,
                color: Color.fromRGBO(226, 226, 226, 1),
              ),
            ),
          ),
          const Divider(
            height: 1,
            color: Color.fromRGBO(226, 226, 226, 1),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: PrimaryButton(
              title: 'Add All To Cart',
              action: () {
                List<ProductShort> productShortList = products
                    .map((favouriteProduct) => favouriteProduct.product)
                    .toList();

                context.read<CartBloc>().add(
                      CartAddFavouritesEvent(
                        products: productShortList,
                      ),
                    );
                context.read<FavouriteCubit>().onClear();
                context.goNamed('cart');
              },
            ),
          ),
        ],
      ),
    );
  }
}
