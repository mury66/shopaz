import 'package:ecommerce_c15_str/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/login_request.dart';

abstract class AuthRemoteDS {
  Future<AuthResponseModel> login(LoginRequest request);
}
