import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murshid/core/utils/app_assets.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/utils/app_text_styles.dart';
import 'package:murshid/core/widgets/custom_header_text.dart';
import 'package:readmore/readmore.dart';

class PeriodDetailsSection extends StatelessWidget {
  const PeriodDetailsSection({
    super.key,
    required this.periodName,
    required this.description,
    required this.imageUrl,
  });

  final String periodName;
  final String description;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomHeaderText(text: "${AppStrings.about} $periodName"),
            const SizedBox(width: 7),
            SvgPicture.asset(Assets.assetsImagesDetails1),
          ],
        ),
        const SizedBox(height: 47),
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -24,
                  child: SvgPicture.asset(Assets.assetsImagesDetails2),
                ),
                SizedBox(
                  width: 196,
                  height: 220,
                  child: SingleChildScrollView(
                    child: ReadMoreText(
                      description,
                      trimLines: 6,
                      trimMode: TrimMode.Line,
                      colorClickableText: Colors.pink,
                      trimCollapsedText: ' Show more',
                      trimExpandedText: ' Show less',
                      style: CustomTextStyles.poppins500style14.copyWith(
                        color: AppColors.black,
                      ),
                      moreStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 111,
              height: 200,
              child: CachedNetworkImage(imageUrl: imageUrl),
            ),
          ],
        ),
      ],
    );
  }
}
