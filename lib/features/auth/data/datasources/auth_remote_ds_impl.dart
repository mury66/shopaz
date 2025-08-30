import 'package:ecommerce_c15_str/core/network/commerce_client.dart';
import 'package:ecommerce_c15_str/di.dart';
import 'package:ecommerce_c15_str/features/auth/data/datasources/auth_remote_ds.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/login_request.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDS)
class AuthRemoteDSImpl implements AuthRemoteDS {
  @override
  Future<AuthResponseModel> login(LoginRequest request) {
    return getIt<CommerceClient>().login(request);
  }
}
