import 'package:dartz/dartz.dart';
import 'package:shopaz_e_commerce/core/error/failures.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';

abstract class HomeRepo {
  Future<Either<CommerceFailure, CategoryModel>> getCategories();
}
