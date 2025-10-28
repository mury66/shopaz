import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';

import '../../data/models/wishlist_response.dart';

abstract class FavouriteRepo {
  Future<Either<CommerceFailure, WishListResponse>> addToFavourite(Map<String, String> request);
  Future<Either<CommerceFailure, WishListResponse>> removeFromFavourite(String productId);
}
