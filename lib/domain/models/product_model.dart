part of '_models.dart';

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
  final int? itemsInCart;

  const ProductModel({
    required this.id,
    required this.title,
    required this.availabilityStatus,
    required this.brand,
    required this.category,
    required this.description,
    required this.dimensions,
    required this.discountePercentage,
    required this.images,
    required this.meta,
    required this.minimumOrderQuantity,
    required this.price,
    required this.rating,
    required this.returnPolicy,
    required this.reviews,
    required this.shippingInformation,
    required this.sku,
    required this.stock,
    required this.tags,
    required this.thumbnail,
    required this.warrantyInformation,
    required this.weight,
    required this.itemsInCart,
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
    int? itemsInCart,
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
    itemsInCart: itemsInCart ?? this.itemsInCart,
  );
}
