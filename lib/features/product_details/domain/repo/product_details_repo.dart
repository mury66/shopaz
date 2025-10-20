import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/product_model.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/products_response.dart';

import '../../data/models/product_details_response.dart';

abstract class ProductDetailsRepo{

 Future<Either<CommerceFailure,ProductDetailsResponse>> getProductDetails(String id);
}