import 'package:store_app/data/dio/client.dart';
import 'package:store_app/data/entities/_entities.dart';

///
/// Service to work with products API

class ProductsService {
  final Client _client;

  ProductsService({required Client client}) : _client = client;
  static const _baseUrl = 'https://dummyjson.com/products';
  static const _itemsPerPage = 30;

  ///
  /// Method to get Products depended on applied filters, current page and sortType
  Future<ProductsList> getProductsList({
    required int page,
    String? sortType,
    String? sortBy,
    String? category,
  }) async {
    final url =
        '$_baseUrl${category == null ? '' : '/category/$category'}?limit=$_itemsPerPage&skip=${(page - 1) * _itemsPerPage}&order=${sortType ?? ''}&sortBy=${sortBy ?? ''}';

    final response = await _client.get(url);
    return ProductsList.fromJson(response.data);
  }

  ///
  /// Method to get only one Product by ID
  Future<Product> getProductInfo({required int productId}) async {
    final url = '$_baseUrl/$productId';
    final response = await _client.get(url);
    return Product.fromJson(response.data);
  }
}
