part of 'auth_bloc.dart';

class AuthState {
  final RequestState? loginRequestState;
  final AuthResponseModel? authResponseModel;
  final CommerceFailure? loginFailure;

  AuthState({
    this.loginRequestState,
    this.authResponseModel,
    this.loginFailure,
  });

  AuthState copyWith({
    RequestState? loginRequestState,
    AuthResponseModel? authResponseModel,
    CommerceFailure? loginFailure,
  }) {
    return AuthState(
      loginRequestState: loginRequestState ?? this.loginRequestState,
      authResponseModel: authResponseModel ?? this.authResponseModel,
      loginFailure: loginFailure ?? this.loginFailure,
    );
  }
}

class AuthInitState extends AuthState {
  AuthInitState() : super(loginRequestState: RequestState.init);
}

enum RequestState { init, success, error, loading }
