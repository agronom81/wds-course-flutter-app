import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/server_api.dart';
import '../../../common/utils.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ServerApi serverApi;

  ProductsCubit({
    required this.serverApi,
  }) : super(ProductsState.init());

  loadExclusiveProducts() {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: true,
      message: '',
    ));
    serverApi.getProducts(tag: 'exclusive').then((value) {
      if (value.isSuccess) {
        dynamic products = getValue(value.data, 'products');
        emit(state.copyWith(
          isLoading: false,
          exclusiveProducts:
              products != null ? createProductShort(products) : [],
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          message: value.message,
        ));
      }
    });
  }

  loadBestSellProducts() {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: true,
      message: '',
    ));
    serverApi.getProducts(tag: 'best_sell').then((value) {
      if (value.isSuccess) {
        dynamic products = getValue(value.data, 'products');
        emit(state.copyWith(
          isLoading: false,
          bestSellProducts:
              products != null ? createProductShort(products) : [],
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          message: value.message,
        ));
      }
    });
  }

  filterCategoryProducts(String categoryId) {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: true,
      message: '',
    ));
    serverApi.getProducts(catId: categoryId).then((value) {
      if (value.isSuccess) {
        dynamic products = getValue(value.data, 'products');
        emit(state.copyWith(
          isLoading: false,
          products: products != null ? createProductShort(products) : [],
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          message: value.message,
        ));
      }
    });
  }
}
