

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/cart_response.dart';
import '../repo/cart_repo.dart';

@injectable
class ChangeProductQuantityUseCase {
  CartRepo repo;

  ChangeProductQuantityUseCase(this.repo);

  Future<Either<CommerceFailure, String>> call(String productId,Map<String, String> request,) =>
      repo.changeProductQuantity(productId, request);
}
