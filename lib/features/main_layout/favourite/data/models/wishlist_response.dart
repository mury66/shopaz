import 'package:json_annotation/json_annotation.dart';

part 'wishlist_response.g.dart';

@JsonSerializable()
class WishListResponse {
  final String status;
  final String message;
  final List<String>? data;

  const WishListResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory WishListResponse.fromJson(Map<String, dynamic> json) =>
      _$WishListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WishListResponseToJson(this);
}
