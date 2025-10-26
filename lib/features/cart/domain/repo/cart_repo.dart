import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/add_to_cart_request.dart';
import '../../data/models/add_to_cart_response.dart';
import '../../data/models/cart_response.dart';


abstract class CartRepo{

 Future<Either<CommerceFailure,AddToCartResponse>> addToCart(AddToCartRequest request);
 Future<Either<CommerceFailure,CartResponse>>  getCartItems();
 Future<Either<CommerceFailure,String>>  changeProductQuantity(String productId,Map<String, String> request);
 Future<Either<CommerceFailure,String>>  deleteCartItem(String productId);
}