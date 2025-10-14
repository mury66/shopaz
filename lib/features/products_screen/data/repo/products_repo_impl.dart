import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/data_sources/ds.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/products_response.dart';
import 'package:shopaz_e_commerce/features/products_screen/domain/repo/products_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo {
  ProdDs ds;

  ProductsRepoImpl(this.ds);

  @override
  Future<Either<CommerceFailure, ProductsResponse>> getProducts(id) async {
    try {

      var res = await ds.getProducts(id);
      print("Hamouda");
      return Right(res);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
