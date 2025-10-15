import 'package:shopaz_e_commerce/core/resources/color_manager.dart';
import 'package:shopaz_e_commerce/core/resources/styles_manager.dart';
import 'package:shopaz_e_commerce/core/resources/values_manager.dart';
import 'package:shopaz_e_commerce/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';

class SubCategoryItem extends StatelessWidget {
  final String? title;
  final String? id;
  final String? catId;
  final String? image;
  final Function navigation;

  const SubCategoryItem(
    this.title,
    this.id,
    this.catId,
    this.image,
    this.navigation, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigation(context,catId),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s12),
                border: Border.all(color: ColorManager.primary, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s10),
                child: Image.asset(image??"", fit: BoxFit.cover),
              ),
            ),
          ),
          Text(
            title??"",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: getRegularStyle(color: ColorManager.primary),
          ),
        ],
      ),
    );
  }
}
