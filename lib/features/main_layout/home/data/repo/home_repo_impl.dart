import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/datasources/home_remote_ds.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

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
}
