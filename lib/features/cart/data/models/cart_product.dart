import 'package:json_annotation/json_annotation.dart';

part 'cart_product.g.dart';

@JsonSerializable()
class CartProduct {
  final int count;

  @JsonKey(name: '_id')
  final String id;

  final String product;
  final int price;

  CartProduct({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductToJson(this);
}
