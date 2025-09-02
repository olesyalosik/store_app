import 'package:store_app/data/entities/_entities.dart';
import 'package:store_app/domain/models/_models.dart';

/// converter for Product

extension ProductConverter on Product {
  ///
  /// Converts Product to ProductModel
  static ProductModel entityToModel(Product product) {
    return ProductModel(
      id: product.id,
      title: product.title,
      availabilityStatus: product.availabilityStatus,
      brand: product.brand,
      category: product.category,
      description: product.description,
      dimensions: DimensionsModel(
        width: product.dimensions?.width,
        depth: product.dimensions?.depth,
        height: product.dimensions?.height,
      ),
      discountePercentage: product.discountePercentage,
      images: product.images,
      meta: MetaModel(
        barcode: product.meta?.barcode,
        createdAt: product.meta?.createdAt,
        qrCode: product.meta?.qrCode,
        updatedAt: product.meta?.updatedAt,
      ),
      minimumOrderQuantity: product.minimumOrderQuantity,
      price: product.price,
      rating: product.rating,
      returnPolicy: product.returnPolicy,
      reviews: product.reviews
          ?.map(
            (e) => ReviewModel(
              rating: e.rating,
              comment: e.comment,
              date: e.date,
              reviewerEmail: e.reviewerEmail,
              reviewerName: e.reviewerName,
            ),
          )
          .toList(),
      shippingInformation: product.shippingInformation,
      sku: product.sku,
      stock: product.stock,
      tags: product.tags,
      thumbnail: product.thumbnail,
      warrantyInformation: product.warrantyInformation,
      weight: product.weight,
    );
  }

  ///
  /// Converts ProductModel to Map
  static Map<String, dynamic> toMap(ProductModel model) {
    return {
      'id': model.id,
      'price': model.price,
      'title': model.title,
      'thumbnail': model.thumbnail,
    };
  }

  ///
  /// Converts Map to ProductModel
  static ProductModel fromMap(Map<String, dynamic> map) => ProductModel(
    id: map['id'],
    title: map['title'],
    thumbnail: map['thumbnail'],
    price: map['price'],
  );
}
