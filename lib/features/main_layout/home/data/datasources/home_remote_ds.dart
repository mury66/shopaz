import 'package:shopaz_e_commerce/core/network/commerce_client.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:injectable/injectable.dart';
import '../model/brand_model.dart';

abstract class HomeRemoteDS {
  Future<CategoryModel> getCategories();
  Future<BrandModel> getBrands();
}

@Injectable(as: HomeRemoteDS)
class HomeRemoteDSImpl implements HomeRemoteDS {
  @override
  Future<CategoryModel> getCategories() {
    return getIt<CommerceClient>().getCategories();
  }
  @override
  Future<BrandModel> getBrands() {
    return getIt<CommerceClient>().getBrands();
  }
}
