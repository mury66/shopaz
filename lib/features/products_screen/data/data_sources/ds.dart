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
  Future<ProductsResponse> getProducts(String id) async {
    try {
      print("category id = $id");
      final client = getIt<CommerceClient>();
      final response = await client.getProducts(id);
      return response;
    } catch (e, st) {
      print("❌ Error in ProdDSImpl.getProducts: $e\n$st");
      rethrow;
    }
  }
}
