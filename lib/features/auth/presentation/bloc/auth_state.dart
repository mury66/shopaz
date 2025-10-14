part of 'auth_bloc.dart';

class AuthState {
  final RequestState? loginRequestState;
  final RequestState? signUpRequestState;
  final AuthResponseModel? authResponseModel;
  final CommerceFailure? loginFailure;
  final AuthResponseModel? signUpResponseModel;
  final CommerceFailure? signUpFailure;

  AuthState({
    this.loginRequestState,
    this.signUpRequestState,
    this.authResponseModel,
    this.loginFailure,
    this.signUpFailure,
    this.signUpResponseModel,
  });

  AuthState copyWith({
    RequestState? loginRequestState,
    RequestState? signUpRequestState,
    AuthResponseModel? authResponseModel,
    CommerceFailure? loginFailure,
    AuthResponseModel? signUpResponseModel,
    CommerceFailure? signUpFailure,
  }) {
    return AuthState(
      loginRequestState: loginRequestState ?? this.loginRequestState,
      signUpRequestState: signUpRequestState ?? this.signUpRequestState,
      authResponseModel: authResponseModel ?? this.authResponseModel,
      loginFailure: loginFailure ?? this.loginFailure,
      signUpResponseModel: signUpResponseModel ?? this.signUpResponseModel,
      signUpFailure: signUpFailure ?? this.signUpFailure,
    );
  }
}

class AuthInitState extends AuthState {
  AuthInitState()
    : super(
        loginRequestState: RequestState.init,
        signUpRequestState: RequestState.init,
      );
}

enum RequestState { init, success, error, loading }
