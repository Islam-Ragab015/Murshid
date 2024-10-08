import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:murshid/core/utils/app_assets.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/utils/app_text_styles.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
      ),
      height: 290,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            AppStrings.appName,
            style: CustomTextStyles.saira700style42,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(Assets.assetsImagesVector1),
              SvgPicture.asset(Assets.assetsImagesVector2)
            ],
          )
        ],
      ),
    );
  }
}
