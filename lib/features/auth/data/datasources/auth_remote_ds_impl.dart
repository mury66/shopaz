import 'package:shopaz_e_commerce/core/network/commerce_client.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/auth/data/datasources/auth_remote_ds.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/auth_response_model.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/login_request.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/signup_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDS)
class AuthRemoteDSImpl implements AuthRemoteDS {
  @override
  Future<AuthResponseModel> login(LoginRequest request) {
    return getIt<CommerceClient>().login(request);
  }

  @override
  Future<AuthResponseModel> signUp(SignupRequest request) {
    return getIt<CommerceClient>().signUp(request);
  }

}
