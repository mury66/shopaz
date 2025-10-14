import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/add_to_cart_request.dart';
import 'package:shopaz_e_commerce/features/cart/domain/entity/cart_entity.dart';
import 'package:shopaz_e_commerce/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddToCartUseCase {
  CartRepo repo;

  AddToCartUseCase(this.repo);

  Future<Either<CommerceFailure, CartEntity>> call(AddToCartRequest request) =>
      repo.addToCart(request);
}
