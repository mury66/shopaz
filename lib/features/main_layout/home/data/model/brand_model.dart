import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel {
  final int? results;
  final Metadata? metadata;
  final List<BrandData>? data;

  const BrandModel({
    this.results,
    this.metadata,
    this.data,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      _$BrandModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;
  final int? nextPage;

  const Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class BrandData {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? updatedAt;
  final String? createdAt;

  const BrandData({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.updatedAt,
    this.createdAt,
  });

  factory BrandData.fromJson(Map<String, dynamic> json) =>
      _$BrandDataFromJson(json);

  Map<String, dynamic> toJson() => _$BrandDataToJson(this);
}
