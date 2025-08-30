// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$AuthResponseModelFromJson(Map<String, dynamic> json) =>
    AuthResponseModel(
      message: json['message'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String,
    );

Map<String, dynamic> _$AuthResponseModelToJson(AuthResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
  name: json['name'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'role': instance.role,
};
