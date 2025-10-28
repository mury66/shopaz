import 'package:dio/dio.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/auth_response_model.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/login_request.dart';
import 'package:shopaz_e_commerce/features/auth/data/models/signup_request.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/add_to_cart_request.dart';
import 'package:shopaz_e_commerce/features/cart/data/models/cart_response.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/data/models/sub_category_response.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/data/model/category_model.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/products_response.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/cart/data/models/add_to_cart_response.dart';
import '../../features/main_layout/favourite/data/models/wishlist_response.dart';
import '../../features/main_layout/home/data/model/brand_model.dart';
import '../../features/product_details/data/models/product_details_response.dart';
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

  @GET("products/{id}")
  Future<ProductDetailsResponse> getProductDetails(@Path('id') String productId);

  @POST("wishlist")
  Future<WishListResponse> addToFavourites(@Header('token') String token , @Body() Map<String, String> request);

  @DELETE("wishlist/{id}")
  Future<WishListResponse> removeFromFavourites(@Path('id') String productId , @Header('token') String token);

  @POST("cart")
  Future<AddToCartResponse> addToCart(@Body() AddToCartRequest request, @Header('token') String token );

  @GET("cart")
  Future<CartResponse> getCartItems( @Header('token') String token );

  @PUT("cart/{id}")
  Future<CartResponse> changeProductQuantity(@Path('id') String productId , @Header('token') String token , @Body() Map<String, String> request);

  @DELETE("cart/{id}")
  Future<CartResponse> deleteCartItem(@Path('id') String productId , @Header('token') String token);

  @DELETE("cart")
  Future<Map<String, String>> deleteAllCartItems(@Header('token') String token);

}

@module
abstract class DioModule {
  Dio get dio => Dio()
    ..interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true));

  @lazySingleton
  CommerceClient get commerceClient =>
      CommerceClient(dio, baseUrl: 'https://ecommerce.routemisr.com/api/v1/');
}








