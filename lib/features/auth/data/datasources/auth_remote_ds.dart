import 'package:shopaz_e_commerce/features/auth/data/models/auth_response_model.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/login_request.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/signup_request.dart';

abstract class AuthRemoteDS {
  Future<AuthResponseModel> login(LoginRequest request);
  Future<AuthResponseModel> signUp(SignupRequest request);
}
