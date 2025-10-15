import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/product_model.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/products_response.dart';

abstract class ProductsRepo{


 Future<Either<CommerceFailure,ProductsResponse>> getProducts(String id);
}