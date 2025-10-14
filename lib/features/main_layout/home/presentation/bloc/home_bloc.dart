import 'package:bloc/bloc.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/domain/usecase/get_categories_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoriesUseCase getCategoriesUseCase;

  HomeBloc(this.getCategoriesUseCase) : super(HomeState.init()) {
    on<HomeGetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(getCategoriesRequestState: RequestState.loading));

      var result = await getCategoriesUseCase();

      result.fold(
        (l) {
          emit(
            state.copyWith(
              getCategoriesRequestState: RequestState.error,
              categoryFailure: l,
            ),
          );
        },
        (r) {
          emit(
            state.copyWith(
              getCategoriesRequestState: RequestState.success,
              categoryModel: r,
            ),
          );
        },
      );
    });
  }
}
