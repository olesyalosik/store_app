part of '_entities.dart';

///
/// Describes product's meta
@JsonSerializable()
class Meta {
  final String? createdAt;
  final String? updatedAt;
  final String? barcode;
  final String? qrCode;

  const Meta({this.barcode, this.createdAt, this.qrCode, this.updatedAt});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
