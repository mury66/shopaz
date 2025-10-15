part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class GetProductsEvent extends ProductsEvent {
  String id;
  GetProductsEvent(this.id);
  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends ProductsEvent {
  String id;

  AddToCartEvent(this.id);
  @override
  List<Object?> get props => [id];
}
