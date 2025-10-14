part of 'home_bloc.dart';

class HomeState extends Equatable {
  final RequestState? getCategoriesRequestState;
  final CommerceFailure? categoryFailure;
  final CategoryModel? categoryModel;

  const HomeState({
    this.getCategoriesRequestState,
    this.categoryFailure,
    this.categoryModel,
  });

  factory HomeState.init() =>
      HomeState(getCategoriesRequestState: RequestState.init);

  // CopyWith method for creating a new instance with modified properties
  HomeState copyWith({
    RequestState? getCategoriesRequestState,
    CommerceFailure? categoryFailure,
    CategoryModel? categoryModel,
  }) {
    return HomeState(
      getCategoriesRequestState:
          getCategoriesRequestState ?? this.getCategoriesRequestState,
      categoryFailure: categoryFailure ?? this.categoryFailure,
      categoryModel: categoryModel ?? this.categoryModel,
    );
  }

  @override
  List<Object?> get props => [
    getCategoriesRequestState ?? '',
    categoryFailure ?? '',
    categoryModel ?? '',
  ];
}
