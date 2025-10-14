import 'package:json_annotation/json_annotation.dart';

part 'sub_category_model.g.dart';

@JsonSerializable()
class SubCategoryModel {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final String? slug;
  final String? category;
  final String? createdAt;
  final String? updatedAt;

  SubCategoryModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}
