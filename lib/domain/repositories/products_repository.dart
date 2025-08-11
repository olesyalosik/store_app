
import 'package:store_app/domain/models/_models.dart';abstract class ProductsRepository {

const ProductsRepository();

Future<ProductsListModel> getProductsList(String url);

Future<ProductModel> getProductInfo(String url);
}