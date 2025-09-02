import 'package:dio/dio.dart';
import 'package:store_app/data/data.dart';
import 'package:store_app/domain/domain.dart';
import 'package:multiple_result/multiple_result.dart';

///
/// Defines logic of ProductsRepository methods
class ProductsRepository extends ProductsRepositoryAbstract {
  final ProductsService _productsService;
  ProductsRepository({required ProductsService productsService})
    : _productsService = productsService;

  ///
  /// Methos to get list of products
  /// Includes logic connected with filtration and sorting
  @override
  Future<Result<ProductsListModel, String>> getProductsList({
    required int page,
    ProductFilter? filter,
  }) async {
    try {
      final productsList = await _productsService.getProductsList(
        page: page,
        sortBy: filter?.sortBy?.sortBy.name,
        sortType: filter?.sortBy?.sortType.name,
        category: filter?.category?.name,
      );
      return Success(ProductsListConverter.entityToModel(productsList));
    } on DioException catch (e) {
      return Error(exceptionMessage(e));
    } catch (e) {
      return Error('Unexpected error');
    }
  }

  ///
  /// Method to get information about single product
  @override
  Future<Result<ProductModel, String>> getProductInfo({required int id}) async {
    try {
      final productInfo = await _productsService.getProductInfo(productId: id);
      return Success(ProductConverter.entityToModel(productInfo));
    } on DioException catch (e) {
      return Error(exceptionMessage(e));
    } catch (e) {
      return Error('Unexpected error');
    }
  }
}
