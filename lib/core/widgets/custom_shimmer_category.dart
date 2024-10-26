import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerCategory extends StatelessWidget {
  const CustomShimmerCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 150.0,
          height: 96.0,
          child: Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.offWhite,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        SizedBox(
          width: 164.0,
          height: 96.0,
          child: Shimmer.fromColors(
            baseColor: AppColors.grey,
            highlightColor: AppColors.offWhite,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
