import 'package:shopaz_e_commerce/core/network/commerce_client.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:injectable/injectable.dart';
import '../models/wishlist_response.dart';

abstract class FavouriteDS {
  Future<WishListResponse> addToFavourites(String token, Map<String, String> request);
  Future<WishListResponse> removeFromFavourites(String productId, String token);
}

@Injectable(as: FavouriteDS)
class SubCategoryDSImpl implements FavouriteDS {
  @override
  Future<WishListResponse> addToFavourites(String token ,Map<String, String> request) {
    return getIt<CommerceClient>().addToFavourites(token ,request);
  }

  @override
  Future<WishListResponse> removeFromFavourites(String productId, String token) {
    return getIt<CommerceClient>().removeFromFavourites(productId , token);
  }
}
