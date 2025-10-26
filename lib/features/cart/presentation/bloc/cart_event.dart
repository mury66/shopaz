part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class AddToCartEvent extends CartEvent {
  final String id;
  AddToCartEvent(this.id);
}
class GetCartItemsEvent extends CartEvent {
  GetCartItemsEvent();
}

class ChangeProductQuantityEvent extends CartEvent {
  final String productId;
  final Map<String, String> request;
  ChangeProductQuantityEvent(this.productId, this.request);
}

class DeleteCartItemEvent extends CartEvent {
  final String productId;
  DeleteCartItemEvent(this.productId);
}

