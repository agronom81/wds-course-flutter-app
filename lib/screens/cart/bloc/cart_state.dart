import '../../../models/cart_product.dart';

class CartState {
  late Map<String, CartProduct> products;

  CartState({
    required this.products,
  });

  CartState copyWith({
    required Map<String, CartProduct> products,
  }) {
    return CartState(
      products: products,
    );
  }

  List<CartProduct> getListProducts() {
    return products.values.toList();
  }

  int getProductsCount() {
    int sum = 0;
    for (CartProduct product in getListProducts()) {
      sum += product.count;
    }
    return sum;
  }

  double getProductsSum() {
    double sum = 0;
    for (CartProduct product in getListProducts()) {
      sum += (product.count * double.parse(product.product.price));
    }
    return double.parse(sum.toStringAsFixed(2));
  }
}
