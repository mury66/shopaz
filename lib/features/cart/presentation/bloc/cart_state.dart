part of 'cart_bloc.dart';

class CartState {
  final RequestState? addToCartRequestState;
  final RequestState? getCartItemsCountRequestState;
  final RequestState? getCartItemsRequestState;
  final RequestState? changeProductQuantityRequestState;
  final RequestState? deleteCartItemRequestState;
  final RequestState? deleteAllCartItemsRequestState;
  final AddToCartResponse? addToCartResponse;
  final CartResponse? cartResponse;
  final CommerceFailure? failure;

  const CartState({
    this.addToCartRequestState,
    this.getCartItemsCountRequestState,
    this.getCartItemsRequestState,
    this.changeProductQuantityRequestState,
    this.deleteCartItemRequestState,
    this.deleteAllCartItemsRequestState,
    this.addToCartResponse,
    this.cartResponse,
    this.failure,
  });

  CartState copyWith({
    RequestState? addToCartRequestState,
    RequestState? getCartItemsCountRequestState,
    RequestState? getCartItemsRequestState,
    RequestState? changeProductQuantityRequestState,
    RequestState? deleteCartItemRequestState,
    RequestState? deleteAllCartItemsRequestState,
    AddToCartResponse? addToCartResponse,
    CartResponse? cartResponse,
    CommerceFailure? failure,
  }) {
    return CartState(
      addToCartRequestState:
      addToCartRequestState ?? this.addToCartRequestState,
      getCartItemsCountRequestState:
      getCartItemsCountRequestState ?? this.getCartItemsCountRequestState,
      getCartItemsRequestState:
      getCartItemsRequestState ?? this.getCartItemsRequestState,
      changeProductQuantityRequestState:
      changeProductQuantityRequestState ??
          this.changeProductQuantityRequestState,
      deleteCartItemRequestState:
      deleteCartItemRequestState ?? this.deleteCartItemRequestState,
      deleteAllCartItemsRequestState:
      deleteAllCartItemsRequestState ?? this.deleteAllCartItemsRequestState,
      addToCartResponse: addToCartResponse ?? this.addToCartResponse,
      cartResponse: cartResponse ?? this.cartResponse,
      failure: failure ?? this.failure,
    );
  }
}

final class CartInitial extends CartState {}
