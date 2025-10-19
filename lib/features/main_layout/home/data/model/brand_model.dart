import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  final int results;
  final Metadata metadata;
  final List<BrandData> data;

  const BrandModel({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}

@JsonSerializable()
class Metadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  const Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class BrandData {
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;

  const BrandData({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BrandData.fromJson(Map<String, dynamic> json) =>
      _$BrandDataFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDataToJson(this);
}
