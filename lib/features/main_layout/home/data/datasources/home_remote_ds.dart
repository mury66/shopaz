import 'package:shopaz_e_commerce/core/network/commerce_client.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDS {
  Future<CategoryModel> getCategories();
}

@Injectable(as: HomeRemoteDS)
class HomeRemoteDSImpl implements HomeRemoteDS {
  @override
  Future<CategoryModel> getCategories() {
    return getIt<CommerceClient>().getCategories();
  }
}
