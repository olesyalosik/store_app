part of '_entities.dart';

@JsonSerializable()
class ProductsList {
  final List<Product> products;
  @JsonKey(name: 'total')
  final int? totalRows;
  final int? skip;
  final int? limit;

  const ProductsList({
    this.limit,
    required this.products,
    this.skip,
    required this.totalRows,
  });

  factory ProductsList.fromJson(Map<String, dynamic> json) =>
      _$ProductsListFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsListToJson(this);
}
