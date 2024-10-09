import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_assets.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_text_styles.dart';

class HistoricalPeriodItem extends StatelessWidget {
  const HistoricalPeriodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 164,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: AppColors.grey,
                blurRadius: 4,
                offset: const Offset(10, 10))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 16,
          ),
          Container(
            height: 47,
            width: 65,
            child: Text(
              "Ancient Egypt",
              style: CustomTextStyles.poppins500style18
                  .copyWith(fontSize: 16, color: AppColors.deepBrown),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Container(
            height: 64,
            width: 47,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                (Assets.assetsImagesFrame),
              ),
            )),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
