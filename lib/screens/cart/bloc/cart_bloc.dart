import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/cart_product.dart';
import '../../../models/product_short.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(products: {})) {
    on<CartAddEvent>((event, emit) {
      int count = event.count;
      emit(_onAddProduct(event.product, count));
    });

    on<CartAddFavouritesEvent>((event, emit) {
      emit(_onAddFavourites(event.products));
    });

    on<CartClearEvent>((event, emit) {
      emit(CartState(products: {}));
    });
  }

  CartState _onAddProduct(ProductShort product, int count) {
    final Map<String, CartProduct> updatedProducts = Map.from(state.products);
    String key = product.id.toString();
    if (updatedProducts.containsKey(key)) {
      updatedProducts[key] = CartProduct(
        product: product,
        count: updatedProducts[key]!.count + count,
      );
    } else {
      updatedProducts[key] = CartProduct(
        product: product,
        count: count,
      );
    }
    return CartState(products: updatedProducts);
  }

  CartState _onAddFavourites(List<ProductShort> products) {
    final Map<String, CartProduct> updatedProducts = Map.from(state.products);

    for (ProductShort product in products) {
      String key = product.id.toString();
      if (updatedProducts.containsKey(key)) {
        updatedProducts[key] = CartProduct(
          product: product,
          count: updatedProducts[key]!.count + 1,
        );
      } else {
        updatedProducts[key] = CartProduct(
          product: product,
          count: 1,
        );
      }
    }

    return CartState(products: updatedProducts);
  }
}
