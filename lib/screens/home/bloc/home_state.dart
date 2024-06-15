import 'package:wds_first_app/models/product_short.dart';

class HomeState {
  String message;
  late dynamic data;
  late bool isLoading;
  late List<ProductShort> products;
  late List<Map<String, dynamic>> productsAutocomplete;

  HomeState({
    required this.data,
    required this.products,
    required this.productsAutocomplete,
    required this.isLoading,
    required this.message,
  });

  HomeState.init()
      : isLoading = false,
        message = '',
        products = const [],
        productsAutocomplete = const [],
        data = const [];

  HomeState copyWith({
    dynamic data,
    bool? isLoading,
    String? message,
    List<ProductShort>? products,
    List<Map<String, dynamic>>? productsAutocomplete,
  }) {
    return HomeState(
      data: data ?? this.data,
      products: products ?? this.products,
      productsAutocomplete: productsAutocomplete ?? this.productsAutocomplete,
      isLoading: isLoading ?? this.isLoading,
      message: '',
    );
  }
}
