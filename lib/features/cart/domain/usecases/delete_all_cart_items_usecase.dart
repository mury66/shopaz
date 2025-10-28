import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteAllCartItemsUseCase {
  CartRepo repo;
  DeleteAllCartItemsUseCase(this.repo);
  Future<Either<CommerceFailure, String>> call() =>
      repo.deleteAllCartItems();
}
