part of 'favourite_bloc.dart';

class FavouriteState {
  final RequestState? addToFavouriteRequestState;
  final RequestState? removeFromFavouriteRequestState;
  final CommerceFailure? failure;

  const FavouriteState({
    this.addToFavouriteRequestState,
    this.removeFromFavouriteRequestState,
    this.failure,
  });

  FavouriteState copyWith({
    RequestState? addToFavouriteRequestState,
    RequestState? removeFromFavouriteRequestState,
    CommerceFailure? failure,
  }) {
    return FavouriteState(
      addToFavouriteRequestState:
      addToFavouriteRequestState ?? this.addToFavouriteRequestState,
      removeFromFavouriteRequestState:
      removeFromFavouriteRequestState ?? this.removeFromFavouriteRequestState,
      failure: failure ?? this.failure,
    );
  }
}

final class FavouriteInitial extends FavouriteState {}
