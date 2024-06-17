import '../../../models/product_short.dart';

class ProductsState {
  late List<ProductShort> exclusiveProducts;
  late List<ProductShort> bestSellProducts;
  late List<ProductShort> products;
  String message;
  late bool isLoading;
  late bool isSuccess;

  ProductsState({
    required this.exclusiveProducts,
    required this.bestSellProducts,
    required this.products,
    required this.isLoading,
    required this.isSuccess,
    required this.message,
  });

  ProductsState.init()
      : exclusiveProducts = [],
        bestSellProducts = [],
        products = [],
        isLoading = false,
        isSuccess = true,
        message = '';

  ProductsState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? message,
    List<ProductShort>? exclusiveProducts,
    List<ProductShort>? bestSellProducts,
    List<ProductShort>? products,
  }) {
    return ProductsState(
      exclusiveProducts: exclusiveProducts ?? this.exclusiveProducts,
      bestSellProducts: bestSellProducts ?? this.bestSellProducts,
      products: products ?? [],
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      message: '',
    );
  }
}
