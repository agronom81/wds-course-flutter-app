import '../../../models/user.dart';

class AccountState {
  late User user;
  late bool isLoading;
  late bool isSuccess;
  late String message;

  AccountState({
    required this.user,
    required this.isLoading,
    required this.isSuccess,
    required this.message,
  });

  AccountState.init()
      : user = User(
          id: '',
          user_email: '',
          user_display_name: '',
          avatar: '',
        ),
        message = '',
        isLoading = false,
        isSuccess = false;

  AccountState copyWith({
    bool? isLoading,
    bool? isSuccess,
    User? user,
    String? message,
  }) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user ?? this.user,
      message: '',
    );
  }
}
