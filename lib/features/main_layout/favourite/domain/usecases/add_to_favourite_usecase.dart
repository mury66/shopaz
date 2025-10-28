import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/main_layout/favourite/domain/repo/favourite_repo.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/wishlist_response.dart';

@injectable
class AddToFavouriteUseCase {
  FavouriteRepo repo;

  AddToFavouriteUseCase(this.repo);

  Future<Either<CommerceFailure, WishListResponse>> call(Map<String, String> request) =>
      repo.addToFavourite(request);
}
