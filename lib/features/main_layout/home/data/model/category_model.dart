import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  final int? results;
  final Metadata? metadata;
  final List<Category>? data;

  CategoryModel({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int numberOfPages;
  final int limit;

  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Category {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  @JsonKey(name: 'createdAt')
  final String? createdAt;
  @JsonKey(name: 'updatedAt')
  final String? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
