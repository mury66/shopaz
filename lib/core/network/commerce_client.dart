import 'package:dio/dio.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/login_request.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

part 'commerce_client.g.dart';

@RestApi(baseUrl: 'https://ecommerce.routemisr.com/api/v1/')
abstract class CommerceClient {
  factory CommerceClient(Dio dio, {String? baseUrl}) = _CommerceClient;

  @POST('auth/signin')
  Future<AuthResponseModel> login(@Body() LoginRequest request);
}

@module
abstract class DioModule {
  Dio get dio => Dio()
    ..interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true));

  @lazySingleton
  CommerceClient get commerceClient =>
      CommerceClient(dio, baseUrl: 'https://ecommerce.routemisr.com/api/v1/');
}
