import 'package:shopaz_e_commerce/core/resources/values_manager.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:shopaz_e_commerce/features/products_screen/presentation/bloc/products_bloc.dart';
import 'package:shopaz_e_commerce/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
  create: (context) => getIt<CartBloc>()..add(GetCartItemsEvent()),
  child: Scaffold(
      appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),
      body: BlocProvider(
        create: (context) => getIt<ProductsBloc>()..add(GetProductsEvent()),
        child: BlocConsumer<ProductsBloc, ProductsState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.model?.data?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 7 / 9,
                          ),
                      itemBuilder: (context, index) {
                        return CustomProductWidget(
                          id: state.model?.data?[index].id ?? "",
                          image: state.model?.data?[index].imageCover??"",
                          title: state.model?.data?[index].title ?? "",
                          price:
                              state.model?.data?[index].price?.toDouble() ?? 0.0,
                          rating:
                              state.model?.data?[index].ratingsAverage?.toDouble() ?? 0.0,
                          discountPercentage: 10,
                          height: height,
                          width: width,
                          description:
                              state.model?.data?[index].description ?? "",
                        );
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    ),
);
  }
}
