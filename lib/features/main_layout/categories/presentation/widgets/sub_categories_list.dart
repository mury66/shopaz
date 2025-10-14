import 'package:shopaz_e_commerce/core/resources/assets_manager.dart';
import 'package:shopaz_e_commerce/core/resources/color_manager.dart';
import 'package:shopaz_e_commerce/core/resources/font_manager.dart';
import 'package:shopaz_e_commerce/core/resources/styles_manager.dart';
import 'package:shopaz_e_commerce/core/resources/values_manager.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/presentation/bloc/category_bloc.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/presentation/bloc/category_bloc.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        print(state.subCategoryModel?.data.length);
        return Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              // category title
              SliverToBoxAdapter(
                child: Text(
                  'Laptops & Electronics',
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
              // the category card
              SliverToBoxAdapter(
                child: CategoryCardItem(
                  "Laptops & Electronics",
                  ImageAssets.categoryCardImage,
                  goToCategoryProductsListScreen,
                ),
              ),
              // the grid view of the subcategories
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.subCategoryModel?.data.length ?? 0,
                  (context, index) => SubCategoryItem(
                    state.subCategoryModel?.data[index].name ?? "",
                    state.subCategoryModel?.data[index].id ?? "",
                    ImageAssets.subcategoryCardImage,
                    goToCategoryProductsListScreen,
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: AppSize.s8,
                  crossAxisSpacing: AppSize.s8,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
