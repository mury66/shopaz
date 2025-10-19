import 'package:shopaz_e_commerce/features/main_layout/categories/data/models/metadata.dart';
import 'package:json_annotation/json_annotation.dart';
import 'product_model.dart';


part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
  final int? results;
  final Metadata? metadata;
  final List<ProductModel>? data;

  ProductsResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
}
