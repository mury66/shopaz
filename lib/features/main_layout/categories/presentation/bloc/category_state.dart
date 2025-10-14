part of 'category_bloc.dart';

class CategoryState extends Equatable {
  final RequestState? getCategoriesRequestState;
  final RequestState? getSubCategoriesRequestState;
  final CategoryModel? categoryModel;
  final SubCategoryResponse? subCategoryModel;
  final CommerceFailure? categoryFailure;
  final CommerceFailure? subCategoryFailure;

  const CategoryState({
    this.getCategoriesRequestState,
    this.categoryModel,
    this.categoryFailure,

    this.getSubCategoriesRequestState,
    this.subCategoryModel,
    this.subCategoryFailure,
  });

  CategoryState copyWith({
    RequestState? getCategoriesRequestState,
    CategoryModel? categoryModel,
    CommerceFailure? categoryFailure,

    RequestState? getSubCategoriesRequestState,
    SubCategoryResponse? subCategoryModel,
    CommerceFailure? subCategoryFailure,
  }) {
    return CategoryState(
      getCategoriesRequestState:
          getCategoriesRequestState ?? this.getCategoriesRequestState,
      categoryModel: categoryModel ?? this.categoryModel,
      categoryFailure: categoryFailure ?? this.categoryFailure,

      getSubCategoriesRequestState:
          getSubCategoriesRequestState ?? this.getSubCategoriesRequestState,
      subCategoryModel: subCategoryModel ?? this.subCategoryModel,
      subCategoryFailure: subCategoryFailure ?? this.subCategoryFailure,
    );
  }

  @override
  List<Object?> get props => [
    getCategoriesRequestState,
    categoryModel,
    categoryFailure,
    subCategoryFailure,
    getSubCategoriesRequestState,
    subCategoryModel,
  ];
}

final class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}
