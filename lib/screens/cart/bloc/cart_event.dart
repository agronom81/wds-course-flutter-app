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

class CartChangeEvent extends CartEvent {
  final ProductShort product;
  final int count;

  CartChangeEvent({
    required this.product,
    required this.count,
  }) : super();
}

class CartRemoveEvent extends CartEvent {
  final int productId;

  CartRemoveEvent({
    required this.productId,
  }) : super();
}

class CartAddFavouritesEvent extends CartEvent {
  final List<ProductShort> products;

  CartAddFavouritesEvent({
    required this.products,
  }) : super();
}

class CartClearEvent extends CartEvent {}
