import 'package:json_annotation/json_annotation.dart';

part 'add_to_cart_response.g.dart';

@JsonSerializable()
class AddToCartResponse {
  final String status;
  final String message;
  final int numOfCartItems;
  final String cartId;
  final AddToCartData data;

  AddToCartResponse({
    required this.status,
    required this.message,
    required this.numOfCartItems,
    required this.cartId,
    required this.data,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) =>
      _$AddToCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartResponseToJson(this);
}

@JsonSerializable()
class AddToCartData {
  @JsonKey(name: '_id')
  final String id;
  final String cartOwner;
  final List<AddToCartProductItem> products;
  final String createdAt;
  final String updatedAt;
  final int totalCartPrice;

  AddToCartData({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.totalCartPrice,
  });

  factory AddToCartData.fromJson(Map<String, dynamic> json) =>
      _$AddToCartDataFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartDataToJson(this);
}

@JsonSerializable()
class AddToCartProductItem {
  final int count;

  @JsonKey(name: '_id')
  final String id;

  /// هنا المنتج بيجي كـ ID فقط مش object كامل
  final String product;

  final int price;

  AddToCartProductItem({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory AddToCartProductItem.fromJson(Map<String, dynamic> json) =>
      _$AddToCartProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartProductItemToJson(this);
}
