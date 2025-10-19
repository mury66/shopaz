import 'package:bloc/bloc.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/domain/usecase/get_brands_usecase.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/domain/usecase/get_categories_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/brand_model.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;

  HomeBloc(this.getCategoriesUseCase,this.getBrandsUseCase) : super(HomeState.init()) {
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
    on<HomeGetBrandsEvent>((event, emit) async {
      emit(state.copyWith(getBrandsRequestState: RequestState.loading));
      var result = await getBrandsUseCase();
      result.fold(
        (l) {
          emit(
            state.copyWith(
              getBrandsRequestState: RequestState.error,
              brandFailure: l,
            ),
          );
        },
        (r) {
          print("teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeest $r");
          emit(
            state.copyWith(
              getBrandsRequestState: RequestState.success,
              brandModel: r,
            ),
          );
        },
      );
    });

  }
}
