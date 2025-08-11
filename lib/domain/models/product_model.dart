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
  });
}