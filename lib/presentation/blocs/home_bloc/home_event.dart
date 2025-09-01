part of 'home_bloc.dart';

abstract class HomeEvent {}

class HomeInitEvent extends HomeEvent {}

class LoadMoreEvent extends HomeEvent {}

class LoadProductsEvent extends HomeEvent {
  final ProductFilter? filter;

  LoadProductsEvent({this.filter});
}

class ApplyFilterEvent extends HomeEvent {
  final SortPair? sortBy;
  final CategoryEnum? category;
  ApplyFilterEvent({required this.sortBy, required this.category});
}
