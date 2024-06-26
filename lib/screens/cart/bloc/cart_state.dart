import '../../../models/cart_product.dart';

class CartState {
  late Map<String, CartProduct> products;
  bool isOpenCheckout;

  CartState({
    required this.products,
    this.isOpenCheckout = false,
  });

  CartState copyWith({
    required Map<String, CartProduct> products,
    bool? isOpenCheckout,
  }) {
    return CartState(
      products: products,
      isOpenCheckout: isOpenCheckout ?? false,
    );
  }

  List<CartProduct> getListProducts() {
    return products.values.toList();
  }

  CartProduct? getProduct(int productId) {
    String key = productId.toString();
    return products[key];
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

  bool isInCart(int productId) {
    final Map<String, CartProduct> mapProducts = Map.from(products);
    String key = productId.toString();
    return mapProducts.containsKey(key);
  }
}
