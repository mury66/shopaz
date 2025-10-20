import 'package:shopaz_e_commerce/core/resources/assets_manager.dart';
import 'package:shopaz_e_commerce/core/resources/color_manager.dart';
import 'package:shopaz_e_commerce/core/resources/font_manager.dart';
import 'package:shopaz_e_commerce/core/resources/styles_manager.dart';
import 'package:shopaz_e_commerce/core/resources/values_manager.dart';
import 'package:shopaz_e_commerce/core/routes_manager/routes.dart';
import 'package:shopaz_e_commerce/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? automaticallyImplyLeading;

  const HomeScreenAppBar({super.key, this.automaticallyImplyLeading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      title: Image.asset(
        ImageAssets.shopazLogo,
        width: 100.w,
        height: 60.h,
        color: ColorManager.primary,
      ),
      bottom: PreferredSize(
        preferredSize: const Size(AppSize.s100, AppSize.s60),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  cursorColor: ColorManager.primary,
                  style: getRegularStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s16,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppMargin.m12.w,
                      vertical: AppMargin.m8.h,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: BorderSide(
                        width: AppSize.s1,
                        color: ColorManager.primary,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: BorderSide(
                        width: AppSize.s1,
                        color: ColorManager.primary,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: BorderSide(
                        width: AppSize.s1,
                        color: ColorManager.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: BorderSide(
                        width: AppSize.s1,
                        color: ColorManager.primary,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10000),
                      borderSide: BorderSide(
                        width: AppSize.s1,
                        color: ColorManager.error,
                      ),
                    ),
                    prefixIcon: ImageIcon(
                      AssetImage(IconsAssets.icSearch),
                      color: ColorManager.primary,
                    ),
                    hintText: "what do you search for?",
                    hintStyle: getRegularStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s16,
                    ),
                  ),
                ),
              ),

              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return Badge(
                    label: Text(
                      state.cartItemsEntity?.numOfCartItems.toString() ?? "0",
                    ),
                    child: IconButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, Routes.cartRoute),
                      icon: ImageIcon(
                        AssetImage(IconsAssets.icCart),
                        color: ColorManager.primary,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // leading: const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => Size(0, 130.h);
}
