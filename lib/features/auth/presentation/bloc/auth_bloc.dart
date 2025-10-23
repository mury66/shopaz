import 'package:bloc/bloc.dart';
import 'package:shopaz_e_commerce/core/cache/cache_helper.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/auth_response_model.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/login_request.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/signup_request.dart';
import 'package:shopaz_e_commerce/features/auth/domain/usecases/login_usecase.dart';
import 'package:shopaz_e_commerce/features/auth/domain/usecases/signup_usecase.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase;
  SignUpUseCase signUpUseCase;

  AuthBloc(this.loginUseCase, this.signUpUseCase) : super(AuthInitState()) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(loginRequestState: RequestState.loading));

      var result = await loginUseCase.call(
        LoginRequest(email: event.email, password: event.password),
      );

      result.fold(
        (fail) {
          emit(
            state.copyWith(
              loginRequestState: RequestState.error,
              loginFailure: fail,
            ),
          );
        },
        (model) {
          CacheHelper.saveString("token", model.token!);
          emit(
            state.copyWith(
              loginRequestState: RequestState.success,
              authResponseModel: model,
            ),
          );
        },
      );
    });

    on<SignUpEvent>((event, emit) async {
      emit(state.copyWith(signUpRequestState: RequestState.loading));

      var result = await signUpUseCase.call(event.request);

      result.fold(
        (l) {
          emit(
            state.copyWith(
              signUpRequestState: RequestState.error,
              signUpFailure: l,
            ),
          );
        },
        (r) {
          CacheHelper.saveString("token", r.token!);
          emit(
            state.copyWith(
              signUpRequestState: RequestState.success,
              signUpResponseModel: r,
            ),
          );
        },
      );
    });
  }
}
