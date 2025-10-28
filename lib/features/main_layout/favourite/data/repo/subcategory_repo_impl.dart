import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/cache/cache_helper.dart';
import '../../domain/repo/favourite_repo.dart';
import '../datasource/favourites_ds.dart';
import '../models/wishlist_response.dart';

@Injectable(as: FavouriteRepo)
class FavouriteRepoImpl implements FavouriteRepo {
  FavouriteDS ds;

  FavouriteRepoImpl(this.ds);

  @override
  Future<Either<CommerceFailure, WishListResponse>> addToFavourite(Map<String, String> request) async {
    try {
      final token = CacheHelper.getString('token')??"";
      final result = await ds.addToFavourites(token, request);
      return Right(result);
    } catch (e) {
      return Left(e as CommerceFailure);
    }

  }

  @override
  Future<Either<CommerceFailure, WishListResponse>> removeFromFavourite(String productId) async {
    try {
      final token = CacheHelper.getString('token')??"";
      final result = await ds.removeFromFavourites(productId,token,);
      return Right(result);
    } catch (e) {
      return Left(e as CommerceFailure);
    }

  }
  }
