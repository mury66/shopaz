import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopaz_e_commerce/core/resources/values_manager.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shopaz_e_commerce/features/products_screen/presentation/bloc/products_bloc.dart';
import 'package:shopaz_e_commerce/features/products_screen/presentation/widgets/custom_product_widget.dart';
import '../../../../core/widget/home_screen_app_bar.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class ProductsScreen extends StatelessWidget {
  final String categoryId;
  const ProductsScreen({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (context) => getIt<CartBloc>(),
        // ..add(LoadCartEvent()),
      child: Scaffold(
        appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),
        body: BlocProvider(
          create: (context) =>
          getIt<ProductsBloc>()..add(GetProductsEvent(categoryId)),
          child: BlocConsumer<ProductsBloc, ProductsState>(
            listener: (context, state) {},
            builder: (context, state) {
              final products = state.model?.data ?? [];

              /// Loading state
              if (state.productsRequestState == RequestState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              /// Error state
              if (state.productsRequestState == RequestState.error) {
                return Center(
                  child: Text(
                    "Failed to load products 😔",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }

              /// Empty state
              if (products.isEmpty) {
                return Center(
                  child: Text(
                    "No products available in this category 🛒",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }

              /// Success state
              return Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 7 / 9,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return CustomProductWidget(
                      id: product.id ?? "",
                      image: product.imageCover ?? "",
                      title: product.title ?? "",
                      price: product.price?.toDouble() ?? 0.0,
                      rating: product.ratingsAverage?.toDouble() ?? 0.0,
                      discountPercentage: 10,
                      height: height,
                      width: width,
                      description: product.description ?? "",
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
