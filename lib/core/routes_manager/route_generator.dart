import 'package:shopaz_e_commerce/core/routes_manager/routes.dart';
import 'package:shopaz_e_commerce/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:shopaz_e_commerce/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:shopaz_e_commerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:shopaz_e_commerce/features/main_layout/main_layout.dart';
import 'package:shopaz_e_commerce/features/product_details/presentation/screen/product_details.dart';
import 'package:shopaz_e_commerce/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';

import '../../features/products_screen/data/models/product_model.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {

      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());

      case Routes.productsScreenRoute:
        final categoryId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => ProductsScreen(categoryId: categoryId),
        );

      case Routes.productDetails:
        final product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (_) => ProductDetails(product: product),
        );

      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) =>  SignInScreen());

      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) =>  SignUpScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
