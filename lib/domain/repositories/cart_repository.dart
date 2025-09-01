import 'package:store_app/domain/models/_models.dart';

abstract class CartRepositoryAbstract {
  Future<List<(ProductModel product, int quantity)>> getCartProducts();

  Future<void> removeItem({required ProductModel product});

  Future<void> addItem({required ProductModel product});

  Future<void> deleteItem({required ProductModel product});
}
