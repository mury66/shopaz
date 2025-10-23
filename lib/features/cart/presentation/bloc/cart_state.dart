part of 'cart_bloc.dart';

class CartState {
  final RequestState? addToCartRequestState;
  final RequestState? getCartItemsCountRequestState;
  final RequestState? getCartItemsRequestState;

  final AddToCartResponse? addToCartResponse;
  final CartResponse? cartResponse;
  final CartCountResponse? cartItemsEntity;

  final CommerceFailure? failure;

  const CartState({
    this.addToCartRequestState,
    this.getCartItemsCountRequestState,
    this.getCartItemsRequestState,
    this.addToCartResponse,
    this.cartResponse,
    this.cartItemsEntity,
    this.failure,
  });

  CartState copyWith({
    RequestState? addToCartRequestState,
    RequestState? getCartItemsCountRequestState,
    RequestState? getCartItemsRequestState,
    AddToCartResponse? addToCartResponse,
    CartResponse? cartResponse,
    CartCountResponse? cartItemsEntity,
    CommerceFailure? failure,
  }) {
    return CartState(
      addToCartRequestState: addToCartRequestState ?? this.addToCartRequestState,
      getCartItemsCountRequestState:
      getCartItemsCountRequestState ?? this.getCartItemsCountRequestState,
      getCartItemsRequestState:
      getCartItemsRequestState ?? this.getCartItemsRequestState,
      addToCartResponse: addToCartResponse ?? this.addToCartResponse,
      cartResponse: cartResponse ?? this.cartResponse,
      cartItemsEntity: cartItemsEntity ?? this.cartItemsEntity,
      failure: failure ?? this.failure,
    );
  }
}

final class CartInitial extends CartState {}
