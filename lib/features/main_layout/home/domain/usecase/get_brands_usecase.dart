import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/brand_model.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase {
  HomeRepo repo;

  GetBrandsUseCase(this.repo);

  Future<Either<CommerceFailure, BrandModel>> call() => repo.getBrands();
}
