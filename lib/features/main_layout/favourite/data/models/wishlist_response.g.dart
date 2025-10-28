// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WishListResponse _$WishListResponseFromJson(Map<String, dynamic> json) =>
    WishListResponse(
      status: json['status'] as String,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$WishListResponseToJson(WishListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
