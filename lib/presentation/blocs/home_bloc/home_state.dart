part of 'home_bloc.dart';

class HomeState {}

class HomeStateSuccess extends HomeState {
  final List<ProductModel> products;
  final bool canLoadMore;
  final bool isLoadingMore;

  HomeStateSuccess({
    required this.products,
    required this.canLoadMore,
    required this.isLoadingMore,
  });
}

class HomeStateError extends HomeState {
  final String errorMessage;

  HomeStateError({required this.errorMessage});
}

class HomeStateLoading extends HomeState {}
