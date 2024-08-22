import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/server_api.dart';
import '../../../core/utils.dart';
import 'home_state.dart';

abstract class HomeEvent {}

class HomeEventError extends HomeEvent {
  final String message;
  HomeEventError(this.message);
}

class HomeCubit extends Cubit<HomeState>
    with BlocPresentationMixin<HomeState, HomeEvent> {
  final ServerApi serverApi;

  HomeCubit({
    required this.serverApi,
  }) : super(HomeState.init());

  loadData() {
    emit(state.copyWith(
      isLoading: true,
      message: '',
    ));
    serverApi.getHome().then((value) {
      if (value.isSuccess) {
        emit(
          state.copyWith(
            isLoading: false,
            data: value.data,
            isSuccess: true,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            message: value.message,
            isSuccess: false,
            data: [],
          ),
        );
        emitPresentation(HomeEventError(value.message));
      }
    });
  }

  loadProducts() {
    serverApi.getProducts().then((value) {
      if (value.isSuccess) {
        dynamic products = getValue(value.data, 'products');
        if (products != null && products.length > 0) {
          emit(state.copyWith(
            products: createProductShort(products),
          ));
          _createProductsList(products);
        }
      }
    });
  }

  _createProductsList(dynamic products) {
    List<Map<String, dynamic>> productOptions = [];
    if (products.isNotEmpty) {
      for (Map<String, dynamic> product in products) {
        productOptions.add({
          'id': product['id'],
          'name': product['name'],
        });
      }
      emit(state.copyWith(
        productsAutocomplete: productOptions,
      ));
    }
  }
}
