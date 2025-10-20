import 'package:json_annotation/json_annotation.dart';
import '../../../main_layout/categories/data/models/sub_category_model.dart';
import '../../../main_layout/home/data/model/brand_model.dart';
import '../../../main_layout/home/data/model/category_model.dart';

part 'product_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductModel {
  final List<String>? images;
  final List<SubCategoryModel>? subcategory;
  final int? ratingsQuantity;

  @JsonKey(name: '_id')
  final String? id;

  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final num? price;
  final dynamic priceAfterDiscount;
  final String? imageCover;
  final CategoryModel? category;
  final BrandModel? brand;
  final num? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  final dynamic sold;

  ProductModel({
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.priceAfterDiscount,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.sold,
  });

  /// ✅ factory & toJson (auto-generated)
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
