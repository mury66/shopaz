import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopaz_e_commerce/core/resources/assets_manager.dart';
import 'package:shopaz_e_commerce/core/widget/product_card.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/presentation/bloc/home_bloc.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/presentation/widgets/custom_ads_widget.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/presentation/widgets/custom_section_bar.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      if (mounted) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % adsImages.length;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        // 🌀 Loading
        if (state.getCategoriesRequestState == RequestState.loading ||
            state.getBrandsRequestState == RequestState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        // ❌ Error
        if (state.categoryFailure != null || state.brandFailure != null) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.categoryFailure?.message ??
                      state.brandFailure?.message ??
                      "Something went wrong",
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>()
                      ..add(HomeGetBrandsEvent())
                      ..add(HomeGetCategoriesEvent());
                  },
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }

        // 🫙 Empty Data
        if (state.categoryModel?.data?.isEmpty ?? true) {
          return const Center(child: Text("No categories found"));
        }

        if (state.brandModel?.data?.isEmpty ?? true) {
          return const Center(child: Text("No brands found"));
        }

        // ✅ Success
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAdsWidget(
                  adsImages: adsImages,
                  currentIndex: _currentIndex,
                  timer: _timer,
                ),
                SizedBox(height: 20.h),

                // 🟢 Categories Section
                CustomSectionBar(
                  sectionNname: 'Categories',
                  function: () {},
                ),
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categoryModel?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final category = state.categoryModel?.data?[index];
                      if (category == null) return const SizedBox.shrink();
                      return Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: CustomCategoryWidget(category: category),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20.h),

                // 🟣 Brands Section
                CustomSectionBar(
                  sectionNname: 'Brands',
                  function: () {},
                ),
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.brandModel?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      final brand = state.brandModel?.data?[index];
                      if (brand == null) return const SizedBox.shrink();
                      return Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: CustomBrandWidget(brandData: brand),
                      );
                    },
                  ),
                ),

                SizedBox(height: 20.h),

                // 🟠 Most Selling Products
                CustomSectionBar(
                  sectionNname: 'Most Selling Products',
                  function: () {},
                ),
                SizedBox(
                  height: 360.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const ProductCard(
                        title: "Nike Air Jordan",
                        description:
                        "Nike designs, develops, and sells athletic footwear, apparel, and accessories.",
                        rating: 4.5,
                        price: 1100,
                        priceBeforeDiscound: 1500,
                        image: ImageAssets.categoryHomeImage,
                      );
                    },
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
