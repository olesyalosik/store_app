import 'package:store_app/domain/models/_models.dart';

abstract class ProductsRepositoryAbstract {
  Future<ProductsListModel> getProductsList({required int page});

  Future<ProductModel> getProductInfo({required int id});
}
