import 'package:store_app/data/converters/product_converter.dart';
import 'package:store_app/data/converters/products_list_converter.dart';
import 'package:store_app/data/services/network_services/products_service.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/domain/repositories/products_repository.dart';

class ProductsRepository extends ProductsRepositoryAbstract {
  final ProductsService _productsService;
  ProductsRepository({required ProductsService productsService})
    : _productsService = productsService;

  @override
  Future<ProductsListModel> getProductsList({required int page}) async {
    final productsList = await _productsService.getProductsList(page: page);
    return ProductsListConverter.entityToModel(productsList);
  }

  @override
  Future<ProductModel> getProductInfo({required int id}) async {
    final productInfo = await _productsService.getProductInfo(productId: id);
    return ProductConverter.entityToModel(productInfo);
  }
}
