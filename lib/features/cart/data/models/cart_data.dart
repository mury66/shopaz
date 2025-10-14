import 'package:json_annotation/json_annotation.dart';
import 'cart_product.dart';

part 'cart_data.g.dart';

@JsonSerializable()
class CartData  {
  @JsonKey(name: '_id')
  final String id;

  final String cartOwner;
  final List<CartProduct> products;
  final String createdAt;
  final String updatedAt;

  @JsonKey(name: '__v')
  final int v;

  final int totalCartPrice;

  CartData({
    required this.id,
    required this.cartOwner,
    required this.products,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.totalCartPrice,
  });

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataToJson(this);
}
