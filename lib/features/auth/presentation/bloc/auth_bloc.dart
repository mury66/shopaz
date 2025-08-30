import 'package:bloc/bloc.dart';
import 'package:ecommerce_c15_str/core/error/failures.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/auth_response_model.dart';
import 'package:ecommerce_c15_str/features/auth/data/models/login_request.dart';
import 'package:ecommerce_c15_str/features/auth/domain/usecases/login_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthInitState()) {
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
          emit(
            state.copyWith(
              loginRequestState: RequestState.success,
              authResponseModel: model,
            ),
          );
        },
      );
    });
  }
}
