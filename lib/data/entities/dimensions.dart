part of '_entities.dart';

@JsonSerializable()
class Dimensions {
  final double? width;
  final double? height;
  final double? depth;

  const Dimensions({
    this.width,
    this.depth,
    this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}