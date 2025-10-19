import 'package:dio/dio.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/auth_response_model.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/login_request.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/signup_request.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/add_to_cart_request.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/cart_count_response.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/cart_response.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/data/models/sub_category_response.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/main_layout/home/data/model/brand_model.dart';
part 'commerce_client.g.dart';

@RestApi(baseUrl: 'https://ecommerce.routemisr.com/api/v1/')
abstract class CommerceClient {
  factory CommerceClient(Dio dio, {String? baseUrl}) = _CommerceClient;

  @POST('auth/signin')
  Future<AuthResponseModel> login(@Body() LoginRequest request);

  @GET('categories')
  Future<CategoryModel> getCategories();

  @POST('auth/signup')
  Future<AuthResponseModel> signUp(@Body() SignupRequest request);

  @GET('brands')
  Future<BrandModel> getBrands();

  @GET("categories/{id}/subcategories")
  Future<SubCategoryResponse> getSubCategories(@Path('id') String categoryId);

  @GET("products")
  Future<ProductsResponse> getProducts(@Query("category[in]") String categoryId);

  @GET("products")
  Future<ProductsResponse> getAllProducts();

  @POST("cart")
  Future<CartResponse> addToCart(@Body() AddToCartRequest request, @Header('token') String token );

  @GET("cart")
  Future<CartCountResponse> getCartItems( @Header('token') String token );

}

@module
abstract class DioModule {
  Dio get dio => Dio()
    ..interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true));

  @lazySingleton
  CommerceClient get commerceClient =>
      CommerceClient(dio, baseUrl: 'https://ecommerce.routemisr.com/api/v1/');
}
