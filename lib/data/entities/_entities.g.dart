// GENERATED CODE - DO NOT MODIFY BY HAND

part of '_entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dimensions _$DimensionsFromJson(Map<String, dynamic> json) => Dimensions(
  width: (json['width'] as num?)?.toDouble(),
  depth: (json['depth'] as num?)?.toDouble(),
  height: (json['height'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DimensionsToJson(Dimensions instance) =>
    <String, dynamic>{
      'width': instance.width,
      'height': instance.height,
      'depth': instance.depth,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String?,
  availabilityStatus: json['availabilityStatus'] as String?,
  brand: json['brand'] as String?,
  category: json['category'] as String?,
  description: json['description'] as String?,
  dimensions: json['dimensions'] == null
      ? null
      : Dimensions.fromJson(json['dimensions'] as Map<String, dynamic>),
  discountePercentage: (json['discountePercentage'] as num?)?.toDouble(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  minimumOrderQuantity: (json['minimumOrderQuantity'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toDouble(),
  rating: (json['rating'] as num?)?.toDouble(),
  returnPolicy: json['returnPolicy'] as String?,
  reviews: (json['reviews'] as List<dynamic>?)
      ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
      .toList(),
  shippingInformation: json['shippingInformation'] as String?,
  sku: json['sku'] as String?,
  stock: (json['stock'] as num?)?.toInt(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  thumbnail: json['thumbnail'] as String?,
  warrantyInformation: json['warrantyInformation'] as String?,
  weight: (json['weight'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'category': instance.category,
  'price': instance.price,
  'discountePercentage': instance.discountePercentage,
  'rating': instance.rating,
  'stock': instance.stock,
  'tags': instance.tags,
  'brand': instance.brand,
  'sku': instance.sku,
  'weight': instance.weight,
  'dimensions': instance.dimensions,
  'warrantyInformation': instance.warrantyInformation,
  'shippingInformation': instance.shippingInformation,
  'availabilityStatus': instance.availabilityStatus,
  'reviews': instance.reviews,
  'returnPolicy': instance.returnPolicy,
  'minimumOrderQuantity': instance.minimumOrderQuantity,
  'meta': instance.meta,
  'thumbnail': instance.thumbnail,
  'images': instance.images,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  barcode: json['barcode'] as String?,
  createdAt: json['createdAt'] as String?,
  qrCode: json['qrCode'] as String?,
  updatedAt: json['updatedAt'] as String?,
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'barcode': instance.barcode,
  'qrCode': instance.qrCode,
};

Review _$ReviewFromJson(Map<String, dynamic> json) => Review(
  rating: (json['rating'] as num?)?.toInt(),
  comment: json['comment'] as String?,
  date: json['date'] as String?,
  reviewerEmail: json['reviewerEmail'] as String?,
  reviewerName: json['reviewerName'] as String?,
);

Map<String, dynamic> _$ReviewToJson(Review instance) => <String, dynamic>{
  'rating': instance.rating,
  'comment': instance.comment,
  'date': instance.date,
  'reviewerName': instance.reviewerName,
  'reviewerEmail': instance.reviewerEmail,
};

ProductsList _$ProductsListFromJson(Map<String, dynamic> json) => ProductsList(
  limit: (json['limit'] as num?)?.toInt(),
  products: (json['products'] as List<dynamic>)
      .map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList(),
  skip: (json['skip'] as num?)?.toInt(),
  totalRows: (json['totalRows'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProductsListToJson(ProductsList instance) =>
    <String, dynamic>{
      'products': instance.products,
      'totalRows': instance.totalRows,
      'skip': instance.skip,
      'limit': instance.limit,
    };
