import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopaz_e_commerce/core/resources/values_manager.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shopaz_e_commerce/features/products_screen/presentation/bloc/products_bloc.dart';
import 'package:shopaz_e_commerce/features/products_screen/presentation/widgets/custom_product_widget.dart';
import '../../../../core/error/snack_bars.dart';
import '../../../../core/widget/home_screen_app_bar.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class ProductsScreen extends StatelessWidget {
  final String categoryId;

  const ProductsScreen({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<ProductsBloc>()..add(GetProductsEvent(categoryId))),
      ],
      child: Scaffold(
        appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),

        body: BlocListener<CartBloc, CartState>(
          listener: (context, state) {
            if (state.addToCartRequestState == RequestState.success) {
              final message = state.addToCartResponse?.status ?? "Added to cart successfully ✅";
              showSnack(context, message, Colors.green);
            } else if (state.addToCartRequestState == RequestState.error) {
              final message = state.addToCartResponse?.status ?? "Failed to add to cart ❌";
              showSnack(context, message, Colors.green);
            }
          },

          child: BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              final products = state.model?.data ?? [];

              if (state.productsRequestState == RequestState.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.productsRequestState == RequestState.error) {
                return Center(
                  child: Text(
                    "Failed to load products 😔",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }

              if (products.isEmpty) {
                return Center(
                  child: Text(
                    "No products available in this category 🛒",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 7 / 9,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return CustomProductWidget(
                      height: height,
                      width: width,
                      model: product,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
