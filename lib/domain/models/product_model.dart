part of '_models.dart';

/// Describes ProductModel

class ProductModel {
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
  final DimensionsModel? dimensions;
  final String? warrantyInformation;
  final String? shippingInformation;
  final String? availabilityStatus;
  final List<ReviewModel>? reviews;
  final String? returnPolicy;
  final int? minimumOrderQuantity;
  final MetaModel? meta;
  final String? thumbnail;
  final List<String>? images;

  const ProductModel({
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

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountePercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    int? weight,
    DimensionsModel? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<ReviewModel>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    MetaModel? meta,
    String? thumbnail,
    List<String>? images,
  }) => ProductModel(
    id: id ?? this.id,
    title: title ?? this.title,
    availabilityStatus: availabilityStatus ?? this.availabilityStatus,
    brand: brand ?? this.brand,
    category: category ?? this.category,
    description: description ?? this.description,
    dimensions: dimensions ?? this.dimensions,
    discountePercentage: discountePercentage ?? this.discountePercentage,
    images: images ?? this.images,
    meta: meta ?? this.meta,
    minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
    price: price ?? this.price,
    rating: rating ?? this.rating,
    returnPolicy: returnPolicy ?? this.returnPolicy,
    reviews: reviews ?? this.reviews,
    shippingInformation: shippingInformation ?? this.shippingInformation,
    sku: sku ?? this.sku,
    stock: stock ?? this.stock,
    tags: tags ?? this.tags,
    thumbnail: thumbnail ?? this.thumbnail,
    warrantyInformation: warrantyInformation ?? this.warrantyInformation,
    weight: weight ?? this.weight,
  );
}
