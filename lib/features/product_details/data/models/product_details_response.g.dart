// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsResponse _$ProductDetailsResponseFromJson(
  Map<String, dynamic> json,
) => ProductDetailsResponse(
  data: json['data'] == null
      ? null
      : ProductModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProductDetailsResponseToJson(
  ProductDetailsResponse instance,
) => <String, dynamic>{'data': instance.data?.toJson()};
