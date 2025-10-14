import 'package:shopaz_e_commerce/features/main_layout/categories/data/models/sub_category_model.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/brand_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final List<String>? images;
  final List<SubCategoryModel>? subcategory;
  final int? ratingsQuantity;

  @JsonKey(name: '_id')
  final String id;

  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final CategoryModel? category;
  final BrandModel? brand;
  final num? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;

  ProductModel({
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
