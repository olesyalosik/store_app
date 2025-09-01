import 'package:multiple_result/multiple_result.dart';
import 'package:store_app/domain/models/_models.dart';

abstract class ProductsRepositoryAbstract {
  Future<Result<ProductsListModel, String>> getProductsList({
    required int page,
    ProductFilter? filter,
  });

  Future<Result<ProductModel, String>> getProductInfo({required int id});
}
