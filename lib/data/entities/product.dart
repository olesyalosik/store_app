part of '_entities.dart';

///
/// Describes single product

@JsonSerializable()
class Product {
  final int? id;
  final String? title;
  final String? description;
  final String? category;
  final double? price;
  final double? discountePercentage;
  final double? rating;
  final int? stock;
  final List<String>? tags;
  final String? brand;
  final String? sku;
  final int? weight;
  final Dimensions? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<Review>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final Meta? meta;
  final String? thumbnail;
  final List<String>? images;

  const Product({
    this.id,
    this.title,
    this.availabilityStatus,
    this.brand,
    this.category,
    this.description,
    this.dimensions,
    this.discountePercentage,
    this.images,
    this.meta,
    this.minimumOrderQuantity,
    this.price,
    this.rating,
    this.returnPolicy,
    this.reviews,
    this.shippingInformation,
    this.sku,
    this.stock,
    this.tags,
    this.thumbnail,
    this.warrantyInformation,
    this.weight,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
