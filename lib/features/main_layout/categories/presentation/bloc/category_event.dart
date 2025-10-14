part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();
}

class GetCategoriesEvent extends CategoryEvent {
  @override
  List<Object?> get props => [];
}

class GetSubCategoriesEvent extends CategoryEvent {
  String id;

  GetSubCategoriesEvent(this.id);

  @override
  List<Object?> get props => [id];
}
