import 'package:shopaz_e_commerce/core/network/commerce_client.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

abstract class ProdDs {
  Future<ProductsResponse> getProducts(String id);
}

@Injectable(as: ProdDs)
class ProdDSImpl implements ProdDs {
  @override
  Future<ProductsResponse> getProducts(String id) {
    try {
      print("category id = $id");
      return getIt<CommerceClient>().getProducts(id).catchError((obj) {
        print(obj.toString());
      });
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
