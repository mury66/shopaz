part of 'products_bloc.dart';

class ProductsState extends Equatable {
  final RequestState? productsRequestState;
  final RequestState? addToCartRequestState;
  final ProductsResponse? model;
  final AddToCartResponse? addToCartResponse;
  final CommerceFailure? failure;

  const ProductsState({
    this.productsRequestState,
    this.addToCartRequestState,
    this.model,
    this.addToCartResponse,
    this.failure,
  });

  ProductsState copyWith({
    RequestState? productsRequestState,
    RequestState? addToCartRequestState,
    ProductsResponse? model,
    AddToCartResponse? addToCartResponse,
    CommerceFailure? failure,
  }) {
    return ProductsState(
      productsRequestState:
      productsRequestState ?? this.productsRequestState,
      addToCartRequestState:
      addToCartRequestState ?? this.addToCartRequestState,
      model: model ?? this.model,
      addToCartResponse: addToCartResponse ?? this.addToCartResponse,
      failure: failure ?? this.failure,
    );
  }

  @override
  List<Object?> get props => [
    productsRequestState,
    addToCartRequestState,
    model,
    addToCartResponse,
    failure,
  ];
}

final class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}
