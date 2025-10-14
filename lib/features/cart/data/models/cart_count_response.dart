import 'package:json_annotation/json_annotation.dart';

part 'cart_count_response.g.dart';

@JsonSerializable()
class CartCountResponse {
  final int numOfCartItems;

  CartCountResponse({required this.numOfCartItems});

  factory CartCountResponse.fromJson(Map<String, dynamic> json) =>
      _$CartCountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CartCountResponseToJson(this);
}
