import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopaz_e_commerce/core/resources/assets_manager.dart';
import 'package:shopaz_e_commerce/core/resources/color_manager.dart';
import 'package:shopaz_e_commerce/core/resources/styles_manager.dart';
import 'package:shopaz_e_commerce/core/widget/custom_elevated_button.dart';
import 'package:shopaz_e_commerce/features/product_details/presentation/widgets/product_description.dart';
import 'package:shopaz_e_commerce/features/product_details/presentation/widgets/product_item.dart';
import 'package:shopaz_e_commerce/features/product_details/presentation/widgets/product_label.dart';
import 'package:shopaz_e_commerce/features/product_details/presentation/widgets/product_rating.dart';
import 'package:shopaz_e_commerce/features/product_details/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopaz_e_commerce/features/products_screen/data/models/product_model.dart';

import '../../../../core/error/snack_bars.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../cart/presentation/bloc/cart_bloc.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state.addToCartRequestState == RequestState.success) {
          final message = state.cartResponse?.status ?? "Added to cart successfully";
          showSnack(context, message, Colors.green);
        }

        if (state.addToCartRequestState == RequestState.error) {
          final message = state.cartResponse?.status ?? "Failed to add to cart";
          showSnack(context, message, Colors.green);
        }
      },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          product.title??'Product Details',
          style: getMediumStyle(color: ColorManager.appBarTitleColor)
              .copyWith(fontSize: 20.sp),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(
                AssetImage(IconsAssets.icSearch),
                color: ColorManager.primary,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: ColorManager.primary,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ProductSlider(items: [
              ProductItem(
                imageUrl:
                product.images?[0] ?? "https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg",
              ),
              ProductItem(
                imageUrl:
                product.images?[1] ?? "https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg",
              ),
              ProductItem(
                imageUrl:
                product.images?[2] ?? "https://assets.adidas.com/images/w_1880,f_auto,q_auto/6776024790f445b0873ee66fdcde54a1_9366/GX6544_HM3_hover.jpg",
              )
            ], initialIndex: 0),
            SizedBox(
              height: 24.h,
            ),
            ProductLabel(
                productName: product.title?? "", productPrice: 'EGP ${product.price}'),
            SizedBox(
              height: 16.h,
            ),
            ProductRating(
                productBuyers: product.sold.toString(), productRating: '${product.ratingsAverage.toString()} (${product.ratingsQuantity.toString()})'),
            SizedBox(
              height: 16.h,
            ),
            ProductDescription(
                productDescription: product.description?? ""
            ),
            SizedBox(
              height: 48.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: getMediumStyle(
                              color: ColorManager.primary.withOpacity(.6))
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(product.price.toString(),
                        style:
                            getMediumStyle(color: ColorManager.appBarTitleColor)
                                .copyWith(fontSize: 18.sp))
                  ],
                ),
                SizedBox(
                  width: 33.w,
                ),
                Expanded(
                  child: CustomElevatedButton(
                    label: 'Add to cart',
                    onTap: () {
                      CartBloc.get(context).add(AddToCartEvent(product.id??""));
                    },
                    prefixIcon: Icon(
                      Icons.add_shopping_cart_outlined,
                      color: ColorManager.white,
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  },
);
  }
}
