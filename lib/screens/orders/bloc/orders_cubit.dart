import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/server_api.dart';
import '../../../common/utils.dart';
import '../../../models/order.dart';
import 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final ServerApi serverApi;

  OrdersCubit({
    required this.serverApi,
  }) : super(OrdersState.init());

  getOrders() {
    if (!state.isHasOrders) {
      return;
    }

    emit(state.copyWith(
      isLoading: true,
      isSuccess: true,
      message: '',
    ));
    serverApi.orders(page: state.page).then((value) {
      if (value.isSuccess) {
        int page = getValue(value.data, 'page') ?? 1;
        List<Order> orders =
            createOrdersList(getValue(value.data, 'orders') ?? []);

        if (state.orders.isNotEmpty) {
          emit(
            state.copyWith(
              isLoading: false,
              isSuccess: true,
              page: page + 1,
              orders: state.orders + orders,
              isHasOrders: orders.isNotEmpty,
            ),
          );
        } else {
          emit(
            state.copyWith(
              isLoading: false,
              isSuccess: true,
              page: page + 1,
              orders: orders,
              isHasOrders: orders.isNotEmpty,
            ),
          );
        }
      } else {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          page: state.page,
          message: value.message,
        ));
      }
    });
  }
}
