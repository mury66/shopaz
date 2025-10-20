// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  subcategory: (json['subcategory'] as List<dynamic>?)
      ?.map((e) => SubCategoryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
  id: json['_id'] as String?,
  title: json['title'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  quantity: (json['quantity'] as num?)?.toInt(),
  price: json['price'] as num?,
  priceAfterDiscount: json['priceAfterDiscount'],
  imageCover: json['imageCover'] as String?,
  category: json['category'] == null
      ? null
      : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
  brand: json['brand'] == null
      ? null
      : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
  ratingsAverage: json['ratingsAverage'] as num?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  sold: json['sold'],
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'images': instance.images,
      'subcategory': instance.subcategory?.map((e) => e.toJson()).toList(),
      'ratingsQuantity': instance.ratingsQuantity,
      '_id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'priceAfterDiscount': instance.priceAfterDiscount,
      'imageCover': instance.imageCover,
      'category': instance.category?.toJson(),
      'brand': instance.brand?.toJson(),
      'ratingsAverage': instance.ratingsAverage,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'sold': instance.sold,
    };
