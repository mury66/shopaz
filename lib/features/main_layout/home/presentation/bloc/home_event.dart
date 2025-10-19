part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeGetCategoriesEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeGetBrandsEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
