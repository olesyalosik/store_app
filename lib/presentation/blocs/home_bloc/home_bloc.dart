import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/domain/repositories/products_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ProductsRepositoryAbstract _productsRepository;
  List<ProductModel> products = [];
  int currPage = 1;
  HomeBloc({required ProductsRepositoryAbstract productsRepository})
    : _productsRepository = productsRepository,
      super(HomeState()) {
    on<InitEvent>(_init);
    on<LoadMoreEvent>(_loadMore);
  }

  Future<void> _init(InitEvent event, Emitter<HomeState> emit) async {
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
    add(InitEvent());
  }
}
