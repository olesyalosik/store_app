import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/domain/models/product_filter.dart';

abstract class ProductsRepositoryAbstract {
  Future<ProductsListModel> getProductsList({
    required int page,
    ProductFilter? filter,
  });

  Future<ProductModel> getProductInfo({required int id});
}
