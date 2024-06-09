import 'package:wds_first_app/models/product_short.dart';

class FavouriteProduct {
  ProductShort product;

  FavouriteProduct({
    required this.product,
  });

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
    };
  }

  factory FavouriteProduct.fromJson(Map<String, dynamic> json) {
    return FavouriteProduct(
      product: ProductShort.fromJson(json['product']),
    );
  }
}
