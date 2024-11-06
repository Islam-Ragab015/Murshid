import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_assets.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_text_styles.dart';

class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey,
                blurRadius: 4,
                offset: const Offset(0, 7))
          ]),
      child: Column(
        children: [
          Container(
            width: 120,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: const DecorationImage(
                image: AssetImage(
                  Assets.assetsImagesFrame3,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(height: 11),
          Text(
            "Lionheart",
            style: CustomTextStyles.poppins500style14,
          )
        ],
      ),
    );
  }
}
