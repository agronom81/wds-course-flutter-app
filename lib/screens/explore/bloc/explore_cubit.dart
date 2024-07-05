import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/server_api.dart';
import '../../../../common/utils.dart';
import 'explore_state.dart';

class ExploreCubit extends Cubit<ExploreState> {
  final ServerApi serverApi;

  ExploreCubit({
    required this.serverApi,
  }) : super(ExploreState.init());

  loadCategories() {
    emit(state.copyWith(
      isLoading: true,
      isSuccess: true,
      message: '',
    ));
    serverApi.getCategories().then((value) {
      if (value.isSuccess) {
        emit(state.copyWith(
          isLoading: false,
          categories: value.data != null ? createCategory(value.data) : [],
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
