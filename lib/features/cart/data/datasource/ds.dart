import 'package:shopaz_e_commerce/core/network/commerce_client.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/add_to_cart_request.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/cart_count_response.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/cart_entity.dart';
import '../models/add_to_cart_response.dart';

abstract class CartDS {
  Future<AddToCartResponse> addToCart(AddToCartRequest request, String token);

  // Future<CartCountResponse> getCartItemsCount(String token);

  Future<CartResponse> getCartItems(String token);
}

@Injectable(as: CartDS)
class CartDSImpl implements CartDS {
  @override
  Future<AddToCartResponse> addToCart(AddToCartRequest request, String token) async {
    return getIt<CommerceClient>().addToCart(request, token);
  }

  @override
  // Future<CartCountResponse> getCartItemsCount(String token) {
  //   return getIt<CommerceClient>().getCartItemsCount(token);
  // }

  @override
  Future<CartResponse> getCartItems(String token) {
    return getIt<CommerceClient>().getCartItems(token);
  }
}
