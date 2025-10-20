import 'package:json_annotation/json_annotation.dart';
import '../../../products_screen/data/models/product_model.dart';

part 'product_details_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductDetailsResponse {
  final ProductModel? data;

  ProductDetailsResponse({this.data});

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailsResponseToJson(this);
}
