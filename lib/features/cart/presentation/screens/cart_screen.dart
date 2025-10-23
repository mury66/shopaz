import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopaz_e_commerce/core/resources/assets_manager.dart';
import 'package:shopaz_e_commerce/core/resources/color_manager.dart';
import 'package:shopaz_e_commerce/core/resources/styles_manager.dart';
import 'package:shopaz_e_commerce/core/resources/values_manager.dart';
import 'package:shopaz_e_commerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:shopaz_e_commerce/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  num calculateTotalPrice(num quantity, num price) {
    return quantity*price;
  }
  num totalPrice = 0 ;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(GetCartItemsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.getCartItemsRequestState == RequestState.loading) {
          return Scaffold(
            backgroundColor: ColorManager.white,
            body: const Center(child: CircularProgressIndicator())
          );
        }

        if (state.cartResponse == null || state.cartResponse?.numOfCartItems == 0) {
          return Scaffold(
            appBar: AppBar(),
            backgroundColor: ColorManager.primary,
            body: const Center(child: Text("Your cart is empty")),
          );
        }

        num totalPrice = 0;
        for (var item in state.cartResponse!.data.products) {
          totalPrice += item.count * item.price;
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Cart',
              style: getMediumStyle(
                fontSize: 20,
                color: ColorManager.textColor,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(IconsAssets.icSearch),
                  color: ColorManager.primary,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: ImageIcon(
                  AssetImage(IconsAssets.icCart),
                  color: ColorManager.primary,
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppPadding.p14),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      var product = state.cartResponse!.data.products[index];
                      var quantity = product.count;
                      for (var product in state.cartResponse!.data.products) {
                        var totalPrice = widget.calculateTotalPrice(product.count, product.price );
                        widget.totalPrice += totalPrice;
                      }

                      return CartItemWidget(
                        imagePath: product.product.imageCover,
                        title: product.product.title,
                        price: product.price,
                        quantity: quantity,
                        onDeleteTap: () {},
                        onDecrementTap: (value) {
                          setState(() {
                            quantity--;
                          });
                        },
                        onIncrementTap: (value) {
                          setState(() {
                            quantity++;
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: AppSize.s12.h),
                    itemCount: state.cartResponse?.numOfCartItems??0,
                  ),
                ),
                TotalPriceAndCheckoutBotton(

                  totalPrice:totalPrice as int,
                  checkoutButtonOnTap: () {},
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        );
      },
    );
  }
}

