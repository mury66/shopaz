import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopaz_e_commerce/core/resources/assets_manager.dart';
import 'package:shopaz_e_commerce/core/resources/color_manager.dart';
import 'package:shopaz_e_commerce/core/resources/styles_manager.dart';
import 'package:shopaz_e_commerce/core/resources/values_manager.dart';
import 'package:shopaz_e_commerce/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:shopaz_e_commerce/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(GetCartItemsEvent());
  }

  void _showSnack(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          backgroundColor: color.withOpacity(0.9),
          content: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          duration: const Duration(milliseconds: 900),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.white,
        title: Text(
          'My Cart',
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
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CartBloc, CartState>(
            listenWhen: (previous, current) =>
            previous.changeProductQuantityRequestState !=
                current.changeProductQuantityRequestState,
            listener: (context, state) {
              if (state.changeProductQuantityRequestState ==
                  RequestState.loading) {
                _showSnack(context, "Updating quantity...", Colors.orange);
              } else if (state.changeProductQuantityRequestState ==
                  RequestState.success) {
                _showSnack(
                    context, "Quantity updated successfully", Colors.green);
              } else if (state.changeProductQuantityRequestState ==
                  RequestState.error) {
                _showSnack(context, "Failed to update quantity", Colors.red);
              }
            },
          ),

          BlocListener<CartBloc, CartState>(
            listenWhen: (previous, current) =>
            previous.deleteCartItemRequestState !=
                current.deleteCartItemRequestState,
            listener: (context, state) {
              if (state.deleteCartItemRequestState == RequestState.loading) {
                _showSnack(context, "Removing item...", Colors.orange);
              } else if (state.deleteCartItemRequestState ==
                  RequestState.success) {
                _showSnack(
                    context, "Item removed successfully", Colors.green);
              } else if (state.deleteCartItemRequestState ==
                  RequestState.error) {
                _showSnack(context, "Failed to remove item", Colors.red);
              }
            },
          ),
        ],
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.getCartItemsRequestState == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.teal),
              );
            }

            if (state.cartResponse == null ||
                state.cartResponse?.numOfCartItems == 0) {
              return const Center(
                child: Text(
                  "🛒 Your cart is empty",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              );
            }

            final cart = state.cartResponse!.data;

            return Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final product = cart.products![index];
                        final quantity = product.count;

                        return Container(
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: CartItemWidget(
                            imagePath: product.product.imageCover,
                            title: product.product.title,
                            price: product.price * quantity,
                            quantity: quantity,
                            onDeleteTap: () {
                              CartBloc.get(context).add(
                                DeleteCartItemEvent(product.product.id),
                              );
                            },
                            onDecrementTap: (value) {
                              if (quantity > 1) {
                                CartBloc.get(context).add(
                                  ChangeProductQuantityEvent(
                                    product.product.id,
                                    {"count": "${quantity - 1}"},
                                  ),
                                );
                              }
                            },
                            onIncrementTap: (value) {
                              CartBloc.get(context).add(
                                ChangeProductQuantityEvent(
                                  product.product.id,
                                  {"count": "${quantity + 1}"},
                                ),
                              );
                            },
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 14.h),
                      itemCount: cart.products!.length,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TotalPriceAndCheckoutBotton(
                    totalPrice: cart.totalCartPrice,
                    checkoutButtonOnTap: () {},
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
