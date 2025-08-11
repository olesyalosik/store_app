import 'package:store_app/data/converters/product_converter.dart';
import 'package:store_app/data/converters/products_list_converter.dart';
import 'package:store_app/data/providers/api_provider.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/domain/repositories/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ApiProvider apiProvider;

  const ProductsRepositoryImpl({required this.apiProvider});

  @override
  Future<ProductsListModel> getProductsList(String url) async {
    final productsList = await apiProvider.getProductsList(url);
    return ProductsListConverter.entityToModel(productsList);
  }

  @override
  Future<ProductModel> getProductInfo(String url) async {
    final productInfo = await apiProvider.getProductInfo(url);
    return ProductConverter.entityToModel(productInfo);
  }
}
