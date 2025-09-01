import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/enums/category.dart';
import 'package:store_app/domain/enums/sort_by.dart';
import 'package:store_app/domain/enums/sort_pair.dart';
import 'package:store_app/domain/enums/sort_type.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/domain/models/product_filter.dart';
import 'package:store_app/domain/repositories/products_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductsRepositoryAbstract _productsRepository;
  List<ProductModel> products = [];
  int currPage = 1;
  ProductFilter appliedFilter = ProductFilter.initial();
  HomeBloc({required ProductsRepositoryAbstract productsRepository})
    : _productsRepository = productsRepository,
      super(HomeState()) {
    on<InitEvent>(_init);
    on<LoadMoreEvent>(_loadMore);
    on<LoadProductsEvent>(_load);
    on<ApplyFilterEvent>(_applyFilter);
  }

  Future<void> _init(InitEvent event, Emitter<HomeState> emit) async {
    try {
      final productsList = await _productsRepository.getProductsList(
        page: currPage,
      );
      products.addAll(productsList.products);

      emit(
        HomeStateSuccess(
          products: products,
          canLoadMore: (productsList.totalRows ?? 0) > products.length,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(HomeStateError(errorMessage: e.toString()));
    }
  }

  Future<void> _loadMore(LoadMoreEvent event, Emitter<HomeState> emit) async {
    currPage = currPage + 1;
    add(LoadProductsEvent());
  }

  Future<void> _load(LoadProductsEvent event, Emitter<HomeState> emit) async {
    if (currPage == 1) {
      emit(HomeStateLoading());
    } else {
      emit(
        HomeStateSuccess(
          products: products,
          canLoadMore: true,
          isLoadingMore: true,
        ),
      );
    }
    try {
      final productsList = await _productsRepository.getProductsList(
        page: currPage,
        filter: appliedFilter,
      );
      products.addAll(productsList.products);

      emit(
        HomeStateSuccess(
          products: products,
          canLoadMore: (productsList.totalRows ?? 0) > products.length,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      emit(HomeStateError(errorMessage: e.toString()));
    }
  }

  Future<void> _applyFilter(
    ApplyFilterEvent event,
    Emitter<HomeState> emit,
  ) async {
    currPage = 1;
    products.clear();
    if (event.sortBy == null && event.category == null) {
      appliedFilter = ProductFilter.initial();
    } else {
      appliedFilter = appliedFilter.copyWith(
        sortBy: event.sortBy,
        category: event.category,
      );
    }
    add(LoadProductsEvent(filter: appliedFilter));
  }
}
