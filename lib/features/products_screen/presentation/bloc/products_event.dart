part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class GetProductsEvent extends ProductsEvent {
  final String id;
  const GetProductsEvent(this.id);
  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends ProductsEvent {
  final String id;

  const AddToCartEvent(this.id);
  @override
  List<Object?> get props => [id];
}
