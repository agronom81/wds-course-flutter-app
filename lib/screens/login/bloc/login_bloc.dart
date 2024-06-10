import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/server_api.dart';
import '../../../common/app_preferences.dart';
import '../../../common/utils.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ServerApi api = ServerApi();

  LoginBloc() : super(LoginState()) {
    on<LoginEmailEvent>((event, emit) async {
      emit(LoginStateLoading());

      var result = await api.login(login: event.login, password: event.pass);
      if (result.status) {
        String token = getValue(result.data, 'token');
        AppPreferences.setToken(token);
        emit(LoginStateSuccess(token));
      } else {
        emit(LoginStateError(result.message));
      }
    });
  }
}

class LoginEvent {}

class LoginEmailEvent extends LoginEvent {
  final String login;
  final String pass;

  LoginEmailEvent({
    required this.login,
    required this.pass,
  }) : super();
}

class LoginState {}

class LoginStateLoading extends LoginState {}

class LoginStateError extends LoginState {
  final String message;
  LoginStateError(this.message);
}

class LoginStateSuccess extends LoginState {
  final String token;
  LoginStateSuccess(this.token);
}
