
import '../../../core/core.dart';

class HomeState {
  String message;
  late dynamic data;
  late bool isLoading;
  late bool isSuccess;
  late List<ProductShort> products;
  late List<Map<String, dynamic>> productsAutocomplete;

  HomeState({
    required this.data,
    required this.products,
    required this.productsAutocomplete,
    required this.isLoading,
    required this.message,
    required this.isSuccess,
  });

  HomeState.init()
      : isLoading = false,
        message = '',
        isSuccess = true,
        products = const [],
        productsAutocomplete = const [],
        data = const [];

  HomeState copyWith({
    dynamic data,
    bool? isLoading,
    bool? isSuccess,
    String? message,
    List<ProductShort>? products,
    List<Map<String, dynamic>>? productsAutocomplete,
  }) {
    return HomeState(
      data: data ?? this.data,
      products: products ?? this.products,
      productsAutocomplete: productsAutocomplete ?? this.productsAutocomplete,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      message: '',
    );
  }
}
