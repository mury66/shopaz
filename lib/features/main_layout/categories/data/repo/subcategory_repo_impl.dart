import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/data/datasource/sub_category_ds.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/data/models/sub_category_model.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/data/models/sub_category_response.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/domain/repo/subcategory_repo.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubCategoryRepo)
class SubCategoryRepoImpl implements SubCategoryRepo {
  SubCategoryDS ds;

  SubCategoryRepoImpl(this.ds);

  @override
  Future<Either<CommerceFailure, SubCategoryResponse>> getSubCategories(
    String id,
  ) async {
    try {
      var result = await ds.getSubCategory(id);

      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: "Something went wrong"));
    }
  }
}
