part of 'cart_bloc.dart';


class CartState {
  final RequestState? addToCartRequestState;
  final RequestState? getCartItemsRequestState;
  final CartEntity? cartEntity;
  final CartCountResponse? cartItemsEntity;
  final CommerceFailure? failure;

  const CartState({
    this.addToCartRequestState,
    this.getCartItemsRequestState,
    this.cartItemsEntity,
    this.cartEntity,
    this.failure,
  });

  CartState copyWith({
    RequestState? addToCartRequestState,
    RequestState? getCartItemsRequestState,
    CartEntity? cartEntity,
    CartCountResponse? cartItemsEntity,
    CommerceFailure? failure,
  }) {
    return CartState(
      addToCartRequestState:
      addToCartRequestState ?? this.addToCartRequestState,
      getCartItemsRequestState:
      getCartItemsRequestState ?? this.getCartItemsRequestState,
      cartEntity: cartEntity ?? this.cartEntity,
      cartItemsEntity: cartItemsEntity ?? this.cartItemsEntity,
      failure: failure ?? this.failure,
    );
  }
}


final class CartInitial extends CartState {}
