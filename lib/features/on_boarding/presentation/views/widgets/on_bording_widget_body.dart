import 'package:flutter/material.dart';

import 'package:murshid/core/utils/app_text_styles.dart';

import 'package:murshid/features/on_boarding/data/models/on_boarding_model.dart';
import 'package:murshid/features/on_boarding/presentation/views/widgets/custom_somth_page_indicator.dart';

class OnBoardingWidgetBody extends StatelessWidget {
  const OnBoardingWidgetBody(
      {super.key, required this.controller, this.onPageChanged});
  final PageController controller;
  final Function(int)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        onPageChanged: onPageChanged,
        physics: const BouncingScrollPhysics(),
        controller: controller,
        itemCount: onBoardingDataList.length,
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              height: 290,
              width: 343,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(onBoardingDataList[index].image),
                    fit: BoxFit.fill),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomSmothPageIndicator(controller: controller),
            const SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              onBoardingDataList[index].title,
              style: CustomTextStyles.poppins500style24.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                onBoardingDataList[index].subTitle,
                style: CustomTextStyles.poppins300style16),
          ],
        ),
      ),
    );
  }
}
