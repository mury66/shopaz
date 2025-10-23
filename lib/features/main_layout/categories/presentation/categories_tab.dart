import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopaz_e_commerce/core/resources/values_manager.dart';
import 'package:shopaz_e_commerce/di.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/presentation/bloc/category_bloc.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:shopaz_e_commerce/features/main_layout/categories/presentation/widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, CategoryState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppPadding.p12,
            vertical: AppPadding.p12,
          ),
          child: Row(
            children: [
              const CategoriesList(),
              SizedBox(width: AppSize.s16),
              const SubCategoriesList(),
            ],
          ),
        );
      },
    );
  }
}
