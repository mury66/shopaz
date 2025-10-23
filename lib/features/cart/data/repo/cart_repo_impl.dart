import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/cache/cache_helper.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/cart/data/datasource/ds.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/add_to_cart_request.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/cart_response.dart';
import 'package:shopaz_e_commerce/features/cart/domain/entity/cart_entity.dart';
import 'package:shopaz_e_commerce/features/cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

import '../models/add_to_cart_response.dart';

@Injectable(as: CartRepo)
class CartRepoIMpl implements CartRepo {
  CartDS ds;

  CartRepoIMpl(this.ds);

  @override
  Future<Either<CommerceFailure, AddToCartResponse>> addToCart(
      AddToCartRequest request,) async {
    try {
      String token = CacheHelper.getString('token') ?? "";
      var result = await ds.addToCart(request, token);
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  // Future<Either<CommerceFailure, CartCountResponse>> getCartItemsCount() async {
  //   try {
  //     String token = CacheHelper.getString('token') ?? "";
  //     var result = await ds.getCartItemsCount(token);
  //     return Right(result);
  //   } catch (e) {
  //     return Left(GeneralFailure(message: e.toString()));
  //   }
  // }

  @override
  Future<Either<CommerceFailure, CartResponse>> getCartItems() async {
    try {
      String token = CacheHelper.getString('token') ?? "";
      var result = await ds.getCartItems(token);
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}