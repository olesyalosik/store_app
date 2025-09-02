import 'package:store_app/data/data.dart';
import 'package:store_app/domain/domain.dart';

///
/// Defines logic of CartRepository methods

class CartRepositoryImpl implements CartRepositoryAbstract {
  final CartDatabaseService _databaseService;
  CartRepositoryImpl({required CartDatabaseService databaseService})
    : _databaseService = databaseService;
  @override
  ///
  /// Method to increase quantity
  Future<void> addItem({required ProductModel product}) async {
    await _databaseService.addItem(item: ProductConverter.toMap(product));
  }

  ///
  /// Method to fully delete quantity
  @override
  Future<void> deleteItem({required ProductModel product}) async {
    await _databaseService.deleteItem(id: product.id!);
  }

  ///
  /// Method to get all products added to cart
  @override
  Future<List<(ProductModel product, int quantity)>> getCartProducts() async {
    final response = await _databaseService.getItemsWithQuantity();
    return response
        .map((e) => (ProductConverter.fromMap(e), e['quantity'] as int))
        .toList();
  }

  ///
  /// Method to decrease quantity
  @override
  Future<void> removeItem({required ProductModel product}) async {
    await _databaseService.removeItem(id: product.id!);
  }
}
