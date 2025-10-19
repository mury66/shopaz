import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/datasources/home_remote_ds.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/brand_model.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repo/home_repo.dart';
import '../model/category_model.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  HomeRemoteDS remoteDS;

  HomeRepoImpl(this.remoteDS);

  @override
  Future<Either<CommerceFailure, CategoryModel>> getCategories() async {
    try {
      var result = await remoteDS.getCategories();

      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<CommerceFailure, BrandModel>> getBrands() async {
    try {
      var result = await remoteDS.getBrands();

      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }
}
