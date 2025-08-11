part of '_models.dart';
class ProductsListModel {
  final List<ProductModel> products;
  final int? totalRows;
  final int? skip;
  final int? limit;

  const ProductsListModel({
    required this.limit,
    required this.products,
    required this.skip,
    required this.totalRows,
  });


}