import 'dart:async';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/presentation/bloc/home_bloc.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';
import 'package:shopaz_e_commerce/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/product_card.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import 'widgets/custom_ads_widget.dart';
import 'widgets/custom_section_bar.dart';

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
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(HomeGetBrandsEvent())
        ..add(HomeGetCategoriesEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          // Handle loading state
          if (state.getCategoriesRequestState == RequestState.loading ||
              state.getBrandsRequestState == RequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle error state
          if (state.categoryFailure != null || state.brandFailure != null) {
            return Center(
              child: Text(
                state.categoryFailure?.message ??
                    state.brandFailure?.message ??
                    "Something went wrong",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          // Handle empty data
          if (state.categoryModel?.data == null ||
              state.categoryModel!.data!.isEmpty) {
            return const Center(child: Text("No categories found"));
          }

          if (state.brandModel?.data == null ||
              state.brandModel!.data!.isEmpty) {
            return const Center(child: Text("No brands found"));
          }

          // Success state — show UI
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomAdsWidget(
                  adsImages: adsImages,
                  currentIndex: _currentIndex,
                  timer: _timer,
                ),
                Column(
                  children: [
                    CustomSectionBar(
                        sectionNname: 'Categories', function: () {}),
                    SizedBox(
                      height: 280.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categoryModel?.data?.length ?? 0,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final category = state.categoryModel?.data?[index];
                          if (category == null) return const SizedBox.shrink();
                          return CustomCategoryWidget(category: category);
                        },
                      ),
                    ),
                    SizedBox(height: 12.h),
                    CustomSectionBar(sectionNname: 'Brands', function: () {}),
                    SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.brandModel?.data?.length ?? 0,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final brand = state.brandModel?.data![index];
                          if (brand == null) return const SizedBox.shrink();
                          return CustomBrandWidget(brandData: brand);
                        },
                      ),
                    ),
                    CustomSectionBar(
                      sectionNname: 'Most Selling Products',
                      function: () {},
                    ),
                    SizedBox(
                      height: 360.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return const ProductCard(
                            title: "Nike Air Jordan",
                            description:
                            "Nike is a multinational corporation that designs, develops, and sells athletic footwear, apparel, and accessories.",
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
              ],
            ),
          );
        },
      ),
    );
  }
}
