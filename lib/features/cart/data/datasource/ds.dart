import 'package:shopaz_e_commerce/core/network/commerce_client.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/add_to_cart_request.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/cart_response.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/cart_entity.dart';
import '../models/add_to_cart_response.dart';

abstract class CartDS {
  Future<AddToCartResponse> addToCart(AddToCartRequest request, String token);

  Future<CartResponse> changeProductQuantity(String productId, String token, Map<String, String> request);

  Future<CartResponse> getCartItems(String token);

  Future<CartResponse> deleteCartItem(String productId,String token);

  Future<Map<String, String>> deleteAllCartItems( String token);
}

@Injectable(as: CartDS)
class CartDSImpl implements CartDS {
  @override
  Future<AddToCartResponse> addToCart(AddToCartRequest request, String token) async {
    return getIt<CommerceClient>().addToCart(request, token);
  }

  @override
  Future<CartResponse> getCartItems(String token) {
    return getIt<CommerceClient>().getCartItems(token);
  }

  @override
  Future<CartResponse> changeProductQuantity(String productId, String token, Map<String, String> request) {
    return getIt<CommerceClient>().changeProductQuantity(productId, token, request);
  }

  @override
  Future<CartResponse> deleteCartItem(String productId, String token) {
    return getIt<CommerceClient>().deleteCartItem(productId, token);
  }

  @override
  Future<Map<String, String>> deleteAllCartItems(String token) {
    return getIt<CommerceClient>().deleteAllCartItems(token);
  }





}
