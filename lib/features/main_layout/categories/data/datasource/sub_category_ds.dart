import 'package:shopaz_e_commerce/core/network/commerce_client.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/data/models/sub_category_model.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/data/models/sub_category_response.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:injectable/injectable.dart';

abstract class SubCategoryDS {
  Future<SubCategoryResponse> getSubCategory(String id);
}

@Injectable(as: SubCategoryDS)
class SubCategoryDSImpl implements SubCategoryDS {
  @override
  Future<SubCategoryResponse> getSubCategory(String id) {
    return getIt<CommerceClient>().getSubCategories(id);
  }
}
