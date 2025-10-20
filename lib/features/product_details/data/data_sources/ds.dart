import 'package:shopaz_e_commerce/core/network/commerce_client.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

import '../models/product_details_response.dart';

abstract class ProdDetailsDs {
  Future<ProductDetailsResponse> getProductDetails(String id);
}

@Injectable(as: ProdDetailsDs)
class ProdDetailsDsImpl implements ProdDetailsDs {
  @override
  Future<ProductDetailsResponse> getProductDetails(String id) async {
    try {
      print("prod id = $id");
      final client = getIt<CommerceClient>();
      final response = await client.getProductDetails(id);
      return response;
    } catch (e, st) {
      print("❌ Error in ProdDetailsDsImpl.getProductDetails: $e\n$st");
      rethrow;
    }
  }
}
