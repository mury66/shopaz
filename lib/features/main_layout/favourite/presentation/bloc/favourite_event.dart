part of 'favourite_bloc.dart';

@immutable
sealed class FavouriteEvent {}

class AddToFavouriteEvent extends FavouriteEvent {
  final String productId;
  AddToFavouriteEvent(this.productId);
}

class RemoveFromFavouriteEvent extends FavouriteEvent {
  final String productId;
  RemoveFromFavouriteEvent(this.productId);
}
