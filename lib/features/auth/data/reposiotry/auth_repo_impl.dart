import 'package:dartz/dartz.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/auth/data/datasources/auth_remote_ds.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/login_request.dart';
import 'package:ecommerce_c15_str/features/auth/domain/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDS authRemoteDS;

  AuthRepoImpl(this.authRemoteDS);

  @override
  Future<Either<CommerceFailure, AuthResponseModel>> login(
    LoginRequest request,
  ) async {
    try {
      var result = await authRemoteDS.login(request);
      if(result.message != "success"){
        return Left(WrongPasswordFailure(message: result.message));
      }
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
