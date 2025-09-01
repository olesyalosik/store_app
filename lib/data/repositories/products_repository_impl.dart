import 'package:dio/dio.dart';
import 'package:store_app/data/converters/product_converter.dart';
import 'package:store_app/data/converters/products_list_converter.dart';
import 'package:store_app/data/repositories/helpers/error_helper.dart';
import 'package:store_app/data/services/network_services/products_service.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/domain/models/product_filter.dart';
import 'package:store_app/domain/repositories/products_repository.dart';
import 'package:multiple_result/multiple_result.dart';

class ProductsRepository extends ProductsRepositoryAbstract {
  final ProductsService _productsService;
  ProductsRepository({required ProductsService productsService})
    : _productsService = productsService;

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
