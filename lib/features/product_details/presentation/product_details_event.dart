part of 'product_details_bloc.dart';

@immutable
sealed class ProductDetailsEvent extends Equatable{}

final class GetProductDetailsEvent extends ProductDetailsEvent {
  final String productId;
  GetProductDetailsEvent(this.productId);
  @override
  List<Object?> get props => [];
}

class AddToCartEvent extends ProductDetailsEvent {
  String id;
  AddToCartEvent(this.id);
  @override
  List<Object?> get props => [id];
}
