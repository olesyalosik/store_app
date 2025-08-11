part of '_entities.dart';

@JsonSerializable()
class ProductsList {
  final List<Product> products;
  final int? totalRows;
  final int? skip;
  final int? limit;

  const ProductsList({
    this.limit,
    required this.products,
    this.skip,
    this.totalRows,
  });

    factory ProductsList.fromJson(Map<String, dynamic> json) => _$ProductsListFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsListToJson(this);

}