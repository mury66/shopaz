import 'package:shopaz_e_commerce/features/cart/domain/entity/cart_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'cart_data.dart';

part 'cart_response.g.dart';

@JsonSerializable()
class CartResponse extends CartEntity{
  final String message;
  final String cartId;
  final CartData data;

  CartResponse({
    required String status,
    required this.message,
    required int numOfCartItems,
    required this.cartId,
    required this.data,
  }):super(status,numOfCartItems);

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
