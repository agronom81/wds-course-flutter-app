import '../../../models/user.dart';

class OrdersState {
  late User user;
  late bool isLoading;
  late bool isSuccess;
  late String message;

  OrdersState({
    required this.user,
    required this.isLoading,
    required this.isSuccess,
    required this.message,
  });

  OrdersState.init()
      : user = User(
          id: '',
          user_email: '',
          user_display_name: '',
          avatar: '',
        ),
        message = '',
        isLoading = false,
        isSuccess = false;

  OrdersState copyWith({
    bool? isLoading,
    bool? isSuccess,
    User? user,
    String? message,
  }) {
    return OrdersState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user ?? this.user,
      message: '',
    );
  }
}
