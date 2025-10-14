import 'package:shopaz_e_commerce/core/resources/color_manager.dart';
import 'package:shopaz_e_commerce/core/resources/values_manager.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/presentation/bloc/category_bloc.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: ColorManager.containerGray,
              border: Border(
                // set the border for only 3 sides
                top: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
                left: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
                bottom: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
            ),

            // the categories items list
            child: ClipRRect(
              // clip the corners of the container that hold the list view
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
              child: ListView.builder(
                itemCount: state.categoryModel?.data?.length ?? 0,
                itemBuilder: (context, index) => CategoryItem(
                  index,
                  state.categoryModel?.data?[index].id ?? "",
                  state.categoryModel?.data?[index].name ?? "",
                  selectedIndex == index,
                  onItemClick,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // callback function to change the selected index
  onItemClick(int index, id) {
    BlocProvider.of<CategoryBloc>(context).add(GetSubCategoriesEvent(id));

    setState(() {
      selectedIndex = index;
    });
  }
}
