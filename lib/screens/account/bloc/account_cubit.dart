import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/server_api.dart';
import '../../../common/utils.dart';
import '../../../models/user.dart';
import 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  final ServerApi serverApi;

  AccountCubit({
    required this.serverApi,
  }) : super(AccountState.init());

  getUser() {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: true,
      message: '',
    ));
    serverApi.getUser().then((value) {
      if (value.isSuccess) {
        emit(state.copyWith(
            isLoading: false,
            user: User(
              id: getValue(value.data, 'id') ?? '',
              avatar: getValue(value.data, 'avatar') ?? '',
              user_email: getValue(value.data, 'user_email') ?? '',
              user_display_name:
                  getValue(value.data, 'user_display_name') ?? '',
            )));
      } else {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          message: value.message,
        ));
      }
    });
  }

  clear() async {
    emit(
      state.copyWith(
          isLoading: false,
          message: '',
          isSuccess: false,
          user: User(
            id: '',
            avatar: '',
            user_email: '',
            user_display_name: '',
          )),
    );
  }
}
