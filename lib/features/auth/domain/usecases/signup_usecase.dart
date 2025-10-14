import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/auth_response_model.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/login_request.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/signup_request.dart';
import 'package:shopaz_e_commerce/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpUseCase {
  AuthRepo repo;

  SignUpUseCase(this.repo);

  Future<Either<CommerceFailure, AuthResponseModel>> call(
    SignupRequest request,
  ) {
    return repo.signUp(request);
  }
}
