import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../api/server_api.dart';

class HomeEvent {}

class HomeEventError extends HomeEvent {
  String message;
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
        emit(state.copyWith(
          isLoading: false,
          data: value.data,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          message: value.message,
        ));
        emitPresentation(HomeEventError(value.message));
      }
    });
  }
}

class HomeState {
  String message;
  late dynamic data;
  late bool isLoading;

  HomeState({
    required this.data,
    required this.isLoading,
    required this.message,
  });

  HomeState.init()
      : isLoading = false,
        message = '',
        data = const [];

  HomeState copyWith({
    dynamic data,
    bool? isLoading,
    String? message,
  }) {
    return HomeState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      message: '',
    );
  }
}
