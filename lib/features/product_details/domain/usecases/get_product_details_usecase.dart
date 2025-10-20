import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/products_response.dart';
import 'package:shopaz_e_commerce/features/products_screen/domain/repo/products_repo.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/product_details_response.dart';
import '../repo/product_details_repo.dart';

@injectable
class GetProductDetailsUseCase {
  ProductDetailsRepo repo;

  GetProductDetailsUseCase(this.repo);

  Future<Either<CommerceFailure,ProductDetailsResponse>> call(String id) =>
      repo.getProductDetails(id);
}
