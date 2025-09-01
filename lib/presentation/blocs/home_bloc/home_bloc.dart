import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/domain.dart';

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
    on<HomeInitEvent>(_init);
    on<LoadMoreEvent>(_loadMore);
    on<LoadProductsEvent>(_load);
    on<ApplyFilterEvent>(_applyFilter);
  }

  Future<void> _init(HomeInitEvent event, Emitter<HomeState> emit) async {
    final productsListResult = await _productsRepository.getProductsList(
      page: currPage,
    );
    if (productsListResult.isError()) {
      emit(
        HomeStateError(
          errorMessage: productsListResult.tryGetError() ?? 'Unexpected error',
        ),
      );
    } else {
      final productsList = productsListResult.tryGetSuccess();
      products.addAll(productsList?.products ?? []);

      emit(
        HomeStateSuccess(
          products: products,
          canLoadMore: (productsList?.totalRows ?? 0) > products.length,
          isLoadingMore: false,
        ),
      );
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

    final productsListResult = await _productsRepository.getProductsList(
      page: currPage,
      filter: appliedFilter,
    );
    if (productsListResult.isError()) {
      emit(
        HomeStateError(
          errorMessage: productsListResult.tryGetError() ?? 'Unexpected error',
        ),
      );
    } else {
      final productsList = productsListResult.tryGetSuccess();
      products.addAll(productsList?.products ?? []);

      emit(
        HomeStateSuccess(
          products: products,
          canLoadMore: (productsList?.totalRows ?? 0) > products.length,
          isLoadingMore: false,
        ),
      );
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
