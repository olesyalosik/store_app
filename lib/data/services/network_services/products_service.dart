import 'package:store_app/data/dio/client.dart';
import 'package:store_app/data/entities/_entities.dart';

class ProductsService {
  final Client _client;

  ProductsService({required Client client}) : _client = client;
  static const _baseUrl = 'https://dummyjson.com/products';
  static const _itemsPerPage = 30;

  Future<ProductsList> getProductsList({required int page}) async {
    final url =
        '$_baseUrl?limit=$_itemsPerPage&skip=${(page - 1) * _itemsPerPage}';

    final response = await _client.get(url);
    return ProductsList.fromJson(response.data);
  }

  Future<Product> getProductInfo({required int productId}) async {
    final url = '$_baseUrl/$productId';
    final response = await _client.get(url);
    return Product.fromJson(response.data);
  }
}
