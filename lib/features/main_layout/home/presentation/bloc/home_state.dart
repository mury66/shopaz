part of 'home_bloc.dart';

class HomeState extends Equatable {
  final RequestState? getCategoriesRequestState;
  final CommerceFailure? categoryFailure;
  final CategoryModel? categoryModel;
  final RequestState? getBrandsRequestState;
  final BrandModel? brandModel;
  final CommerceFailure? brandFailure;

  const HomeState({
    this.getCategoriesRequestState,
    this.categoryFailure,
    this.categoryModel,
    this.getBrandsRequestState,
    this.brandModel,
    this.brandFailure,
  });

  /// Initial state
  factory HomeState.init() => const HomeState(
    getCategoriesRequestState: RequestState.init,
    getBrandsRequestState: RequestState.init,
  );

  /// CopyWith method to update specific properties
  HomeState copyWith({
    RequestState? getCategoriesRequestState,
    CommerceFailure? categoryFailure,
    CategoryModel? categoryModel,
    RequestState? getBrandsRequestState,
    BrandModel? brandModel,
    CommerceFailure? brandFailure,
  }) {
    return HomeState(
      getCategoriesRequestState:
      getCategoriesRequestState ?? this.getCategoriesRequestState,
      categoryFailure: categoryFailure ?? this.categoryFailure,
      categoryModel: categoryModel ?? this.categoryModel,
      getBrandsRequestState:
      getBrandsRequestState ?? this.getBrandsRequestState,
      brandModel: brandModel ?? this.brandModel,
      brandFailure: brandFailure ?? this.brandFailure,
    );
  }

  @override
  List<Object?> get props => [
    getCategoriesRequestState,
    categoryFailure,
    categoryModel,
    getBrandsRequestState,
    brandModel,
    brandFailure,
  ];
}
