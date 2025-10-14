import 'package:json_annotation/json_annotation.dart';
import 'metadata.dart';
import 'sub_category_model.dart';

part 'sub_category_response.g.dart';

@JsonSerializable()
class SubCategoryResponse {
  final int results;
  final Metadata metadata;
  final List<SubCategoryModel> data;

  SubCategoryResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryResponseToJson(this);
}
