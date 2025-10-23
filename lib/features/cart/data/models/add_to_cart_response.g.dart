// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddToCartResponse _$AddToCartResponseFromJson(Map<String, dynamic> json) =>
    AddToCartResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      numOfCartItems: (json['numOfCartItems'] as num).toInt(),
      cartId: json['cartId'] as String,
      data: AddToCartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddToCartResponseToJson(AddToCartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'numOfCartItems': instance.numOfCartItems,
      'cartId': instance.cartId,
      'data': instance.data,
    };

AddToCartData _$AddToCartDataFromJson(Map<String, dynamic> json) =>
    AddToCartData(
      id: json['_id'] as String,
      cartOwner: json['cartOwner'] as String,
      products: (json['products'] as List<dynamic>)
          .map((e) => AddToCartProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      totalCartPrice: (json['totalCartPrice'] as num).toInt(),
    );

Map<String, dynamic> _$AddToCartDataToJson(AddToCartData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'cartOwner': instance.cartOwner,
      'products': instance.products,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'totalCartPrice': instance.totalCartPrice,
    };

AddToCartProductItem _$AddToCartProductItemFromJson(
  Map<String, dynamic> json,
) => AddToCartProductItem(
  count: (json['count'] as num).toInt(),
  id: json['_id'] as String,
  product: json['product'] as String,
  price: (json['price'] as num).toInt(),
);

Map<String, dynamic> _$AddToCartProductItemToJson(
  AddToCartProductItem instance,
) => <String, dynamic>{
  'count': instance.count,
  '_id': instance.id,
  'product': instance.product,
  'price': instance.price,
};
