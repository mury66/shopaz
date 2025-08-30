import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/login_request.dart';

abstract class AuthRepo {
  Future<Either<CommerceFailure,AuthResponseModel>> login(LoginRequest request);
}
