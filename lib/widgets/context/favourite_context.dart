import 'package:flutter/material.dart';

import '../../common/app_settings.dart';
import '../../data/favourite/favourite_data.dart';
import '../../models/favourite_product.dart';
import '../../models/product.dart';
import '../../models/product_short.dart';

class FavouriteContext extends StatefulWidget {
  FavouriteContext({
    super.key,
    required this.child,
  });

  final Widget child;
  final AppSettings settings = AppSettings();

  @override
  State<FavouriteContext> createState() => _FavouriteContextState();
}

class _FavouriteContextState extends State<FavouriteContext> {
  Map<String, FavouriteProduct> products = {};

  @override
  void initState() {
    super.initState();
    _getFavourite();
  }

  @override
  Widget build(BuildContext context) {
    return FavouriteData(
      products: products,
      addProduct: _onAddProduct,
      clear: _onClear,
      child: widget.child,
    );
  }

  _onAddProduct(Product product) {
    String key = product.id.toString();
    if (products.containsKey(key)) {
      setState(() {
        products.remove(key);
      });
    } else {
      setState(() {
        products[key] = FavouriteProduct(
          product: ProductShort(
            id: product.id,
            name: product.name,
            short_description: product.shortDescription,
            preview_image: product.preview_image,
            price: product.price,
          ),
        );
      });
    }

    widget.settings.setFavourite(products);
  }

  _onClear() {
    setState(() {
      products = {};
    });
  }

  _getFavourite() async {
    Map<String, FavouriteProduct> newProducts =
        await widget.settings.getFavourite();
    setState(() {
      products = newProducts;
    });
  }
}
