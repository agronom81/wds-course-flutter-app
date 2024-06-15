import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/server_api.dart';
import '../../../common/app_settings.dart';
import '../../../common/utils.dart';

class LoginEvent {}

class LoginEventSuccess extends LoginEvent {
  bool isSuccess;
  LoginEventSuccess(this.isSuccess);
}

class LoginCubit extends Cubit<LoginState> {
  final ServerApi serverApi;
  final AppSettings settings;

  LoginCubit({
    required this.serverApi,
    required this.settings,
  }) : super(LoginState.init());

  login({
    required String login,
    required String password,
  }) async {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: false,
      message: '',
    ));
    var result = await serverApi.login(login: login, password: password);

    if (result.isSuccess) {
      String token = getValue(result.data, 'token');
      settings.setToken(token);
      emit(state.copyWith(
          isLoading: false,
          userEmail: getValue(result.data, 'user_email'),
          avatar: getValue(result.data, 'avatar'),
          message: result.message,
          isSuccess: true,
          userName: getValue(result.data, 'user_display_name')));
    } else {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        message: result.message,
      ));
    }
  }

  logout() async {
    settings.removeToken();
    emit(
      state.copyWith(
          isLoading: false,
          userEmail: '',
          avatar: '',
          message: '',
          isSuccess: false,
          userName: ''),
    );
  }

  signup({
    required String email,
    required String password,
    required String username,
  }) async {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: false,
      message: '',
    ));
    var result = await serverApi.signup(
      email: email,
      password: password,
      username: username,
    );

    if (result.isSuccess) {
      String token = getValue(result.data, 'token');
      settings.setToken(token);
      emit(state.copyWith(
          isLoading: false,
          userEmail: getValue(result.data, 'user_email'),
          avatar: getValue(result.data, 'avatar'),
          message: result.message,
          isSuccess: true,
          userName: getValue(result.data, 'user_display_name')));
    } else {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        message: result.message,
      ));
    }
  }
}

class LoginState {
  String message;
  String userEmail;
  String userName;
  String avatar;
  String token;
  bool isLoading;
  bool isSuccess;

  LoginState({
    required this.userEmail,
    required this.userName,
    required this.avatar,
    required this.token,
    required this.isLoading,
    required this.message,
    required this.isSuccess,
  });

  LoginState.init()
      : userEmail = '',
        userName = '',
        avatar = '',
        token = '',
        message = '',
        isLoading = false,
        isSuccess = false;

  LoginState copyWith({
    String? userEmail,
    String? userName,
    String? avatar,
    String? token,
    String? message,
    bool? isLoading,
    bool? isSuccess,
  }) {
    return LoginState(
      userEmail: userEmail ?? this.userEmail,
      userName: userName ?? this.userName,
      avatar: avatar ?? this.avatar,
      token: token ?? this.token,
      message: message ?? this.message,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
