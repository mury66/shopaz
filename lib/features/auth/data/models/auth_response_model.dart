import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel {
  /// Common for both success and failure responses
  final String message;

  /// Present only on success
  final User? user;
  final String? token;

  /// Present only on failure
  final String? statusMsg;

  AuthResponseModel({
    required this.message,
    this.user,
    this.token,
    this.statusMsg,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseModelToJson(this);

  /// ✅ Helper to check if response indicates failure
  bool get isFailure => statusMsg == 'fail';
}

@JsonSerializable()
class User {
  final String name;
  final String email;
  final String role;

  User({
    required this.name,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
