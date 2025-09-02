part of '_models.dart';

/// Describes ProductModel's Meta

class MetaModel {
  final String? createdAt;
  final String? updatedAt;
  final String? barcode;
  final String? qrCode;

  const MetaModel({
    required this.barcode,
    required this.createdAt,
    required this.qrCode,
    required this.updatedAt,
  });
}
