import '../../../models/favourite_product.dart';

class FavouriteState {
  Map<String, FavouriteProduct> products;

  FavouriteState({
    required this.products,
  });

  FavouriteState.init() : products = {};

  FavouriteState copyWith({
    Map<String, FavouriteProduct>? products,
  }) {
    return FavouriteState(
      products: products ?? {},
    );
  }
}
