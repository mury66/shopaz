import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/main_layout/favourite/domain/repo/favourite_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/wishlist_response.dart';

@injectable
class RemoveFromFavouriteUseCase {
  FavouriteRepo repo;

  RemoveFromFavouriteUseCase(this.repo);

  Future<Either<CommerceFailure, WishListResponse>> call(String productId) =>
      repo.removeFromFavourite(productId);
}
