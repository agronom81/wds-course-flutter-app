import '../../../models/order.dart';

class OrdersState {
  int page;
  late bool isLoading;
  late bool isSuccess;
  late String message;
  late List<Order> orders;
  late bool isHasOrders;

  OrdersState({
    required this.page,
    required this.isLoading,
    required this.isSuccess,
    required this.message,
    required this.orders,
    required this.isHasOrders,
  });

  OrdersState.init()
      : page = 1,
        isHasOrders = true,
        message = '',
        isLoading = false,
        orders = [],
        isSuccess = false;

  OrdersState copyWith({
    bool? isLoading,
    bool? isSuccess,
    int? page,
    String? message,
    List<Order>? orders,
    bool? isHasOrders,
  }) {
    return OrdersState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      page: page ?? this.page,
      message: '',
      orders: orders ?? this.orders,
      isHasOrders: isHasOrders ?? this.isHasOrders,
    );
  }
}
