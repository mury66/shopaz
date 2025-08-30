import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/login_request.dart';
import 'package:ecommerce_c15_str/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepo repo;

  LoginUseCase(this.repo);

  Future<Either<CommerceFailure, AuthResponseModel>> call(
    LoginRequest request,
  ) {
    return repo.login(request);
  }
}
