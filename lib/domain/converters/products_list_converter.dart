import 'package:store_app/domain/converters/product_converter.dart';
import 'package:store_app/data/entities/_entities.dart';
import 'package:store_app/domain/models/_models.dart';

/// converter for ProductList

extension ProductsListConverter on ProductsList {
  static ProductsListModel entityToModel(ProductsList productsList) {
    return ProductsListModel(
      products: productsList.products
          .map((e) => ProductConverter.entityToModel(e))
          .toList(),
      limit: productsList.limit,
      skip: productsList.skip,
      totalRows: productsList.totalRows,
    );
  }
}
