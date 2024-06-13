import '../../../models/product_short.dart';

class CartEvent {}

class CartAddEvent extends CartEvent {
  final ProductShort product;
  int count;

  CartAddEvent({
    required this.product,
    this.count = 1,
  }) : super();
}

class CartAddFavouritesEvent extends CartEvent {
  final List<ProductShort> products;

  CartAddFavouritesEvent({
    required this.products,
  }) : super();
}

class CartClearEvent extends CartEvent {}
