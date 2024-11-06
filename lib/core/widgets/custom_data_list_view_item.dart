import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:murshid/core/functions/navigation.dart';
import 'package:murshid/core/models/data_model.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_text_styles.dart';
import 'package:shimmer/shimmer.dart';

class CustomDataListViewItem extends StatelessWidget {
  const CustomDataListViewItem(
      {super.key, required this.model, required this.routPath});
  final DataModel model;
  final String routPath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customNavigate(context, routPath, extra: model);
      },
      child: Container(
        height: 96,
        width: 164,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey,
                  blurRadius: 8,
                  offset: const Offset(5, 5))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              height: 60,
              width: 85,
              child: Text(
                model.name,
                style: CustomTextStyles.poppins500style18
                    .copyWith(fontSize: 16, color: AppColors.deepBrown),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
              ),
            ),
            SizedBox(
              height: 64,
              width: 47,
              child: CachedNetworkImage(
                imageUrl: model.image,
                placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.grey,
                    highlightColor: AppColors.offWhite,
                    child: Container(
                      width: 47,
                      height: 64,
                      color: AppColors.grey,
                    )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}
