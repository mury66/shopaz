// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
  status: json['status'] as String,
  message: json['message'] as String,
  numOfCartItems: (json['numOfCartItems'] as num).toInt(),
  cartId: json['cartId'] as String,
  data: CartData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'numOfCartItems': instance.numOfCartItems,
      'message': instance.message,
      'cartId': instance.cartId,
      'data': instance.data,
    };
