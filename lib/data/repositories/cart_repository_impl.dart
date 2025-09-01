import 'package:store_app/data/converters/product_converter.dart';
import 'package:store_app/data/services/database_sevices/cart_database_service.dart';
import 'package:store_app/domain/models/_models.dart';
import 'package:store_app/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepositoryAbstract {
  final CartDatabaseService _databaseService;
  CartRepositoryImpl({required CartDatabaseService databaseService})
    : _databaseService = databaseService;
  @override
  Future<void> addItem({required ProductModel product}) async {
    await _databaseService.addItem(item: ProductConverter.toMap(product));
  }

  @override
  Future<void> deleteItem({required ProductModel product}) async {
    await _databaseService.deleteItem(id: product.id!);
  }

  @override
  Future<List<(ProductModel product, int quantity)>> getCartProducts() async {
    final response = await _databaseService.getItemsWithQuantity();
    return response
        .map((e) => (ProductConverter.fromMap(e), e['quantity'] as int))
        .toList();
  }

  @override
  Future<void> removeItem({required ProductModel product}) async {
    await _databaseService.removeItem(id: product.id!);
  }
}
