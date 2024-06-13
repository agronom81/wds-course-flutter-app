import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/app_settings.dart';
import '../../../models/favourite_product.dart';
import '../../../models/product.dart';
import '../../../models/product_short.dart';
import 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final AppSettings settings;

  FavouriteCubit({
    required this.settings,
  }) : super(FavouriteState.init());

  Future<void> loadFavourites() async {
    Map<String, FavouriteProduct> newProducts = await settings.getFavourite();
    emit(state.copyWith(products: newProducts));
  }

  onAddProduct(Product product) {
    String key = product.id.toString();
    Map<String, FavouriteProduct> updatedProducts = Map.from(state.products);
    if (state.products.containsKey(key)) {
      updatedProducts.remove(key);
    } else {
      updatedProducts[key] = FavouriteProduct(
        product: ProductShort(
          id: product.id,
          name: product.name,
          short_description: product.shortDescription,
          preview_image: product.preview_image,
          price: product.price,
        ),
      );
    }

    emit(state.copyWith(products: updatedProducts));
    settings.setFavourite(state.products);
  }

  onClear() {
    emit(state.copyWith(products: {}));
    settings.setFavourite(state.products);
  }
}
