part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final RequestState? productsRequestState;
  final RequestState? addToCartRequestState;
  final ProductsResponse? model;
  final CartEntity? cartEntity;
  final CommerceFailure? failure;

  const ProductsState({
    this.productsRequestState,
    this.addToCartRequestState,
    this.model,
    this.cartEntity,
    this.failure,
  });

  ProductsState copyWith({
    RequestState? productsRequestState,
    RequestState? addToCartRequestState,
    ProductsResponse? model,
    CartEntity? cartEntity,
    CommerceFailure? failure,
  }) {
    return ProductsState(
      productsRequestState: productsRequestState ?? this.productsRequestState,
      model: model ?? this.model,
      failure: failure ?? this.failure,
      addToCartRequestState:
          addToCartRequestState ?? this.addToCartRequestState,
      cartEntity: cartEntity ?? this.cartEntity,
    );
  }

  @override
  List<Object?> get props => [
    productsRequestState,
    model,
    failure,
    cartEntity,
    addToCartRequestState,
  ];
}

final class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}
