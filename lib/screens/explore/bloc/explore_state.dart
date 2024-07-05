import '../../../models/category.dart';

class ExploreState {
  late List<Category> categories;
  String message;
  late bool isLoading;
  late bool isSuccess;

  ExploreState({
    required this.categories,
    required this.isLoading,
    required this.isSuccess,
    required this.message,
  });

  ExploreState.init()
      : categories = [],
        isLoading = false,
        isSuccess = true,
        message = '';

  ExploreState copyWith({
    bool? isLoading,
    bool? isSuccess,
    String? message,
    List<Category>? categories,
  }) {
    return ExploreState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      message: '',
    );
  }
}
