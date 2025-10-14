// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
  id: json['_id'] as String,
  cartOwner: json['cartOwner'] as String,
  products: (json['products'] as List<dynamic>)
      .map((e) => CartProduct.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  v: (json['__v'] as num).toInt(),
  totalCartPrice: (json['totalCartPrice'] as num).toInt(),
);

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
  '_id': instance.id,
  'cartOwner': instance.cartOwner,
  'products': instance.products,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  '__v': instance.v,
  'totalCartPrice': instance.totalCartPrice,
};
