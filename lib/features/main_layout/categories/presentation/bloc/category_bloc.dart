import 'package:bloc/bloc.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/data/models/sub_category_model.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/data/models/sub_category_response.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/domain/usecases/get_sub_category_usecase.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/domain/usecase/get_categories_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'category_event.dart';

part 'category_state.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetCategoriesUseCase categoriesUseCase;
  GetSubCategoryUseCase subCategoryUseCase;

  CategoryBloc(this.categoriesUseCase, this.subCategoryUseCase)
    : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) async {
      switch (event) {
        case GetCategoriesEvent():
          {
            emit(
              state.copyWith(getCategoriesRequestState: RequestState.loading),
            );

            var result = await categoriesUseCase.call();
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
                add(GetSubCategoriesEvent(r.data?.first.id??""));
                emit(
                  state.copyWith(
                    getCategoriesRequestState: RequestState.success,
                    categoryModel: r,
                  ),
                );
              },
            );
          }
        case GetSubCategoriesEvent():
          {
            emit(
              state.copyWith(
                getSubCategoriesRequestState: RequestState.loading,
              ),
            );

            var result = await subCategoryUseCase.call(event.id);
            result.fold(
              (l) {
                emit(
                  state.copyWith(
                    getSubCategoriesRequestState: RequestState.error,
                    subCategoryFailure: l,
                  ),
                );
              },
              (r) {
                print("ROUTE TEST -- ${r.data.length}");
                emit(
                  state.copyWith(
                    getSubCategoriesRequestState: RequestState.success,
                    subCategoryModel: r,
                  ),
                );
              },
            );
          }
      }
    });
  }
}
