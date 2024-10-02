import 'package:flutter/material.dart';
import 'package:murshid/core/functions/navigation.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/utils/app_text_styles.dart';
import 'package:murshid/core/widgets/custom_btn.dart';
import 'package:murshid/features/on_boarding/data/models/on_boarding_model.dart';

class GetButton extends StatelessWidget {
  const GetButton(
      {super.key, required this.currentIndex, required this.controller});
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == onBoardingDataList.length - 1) {
      return Column(
        children: [
          CustomBtn(
              text: AppStrings.createAccount,
              onpressed: () {
                customReplacementNavigate(context, "/signUp");
              }),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {
              customReplacementNavigate(context, "/signIn");
            },
            child: Text(
              AppStrings.loginNow,
              style: CustomTextStyles.poppins300style16.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    } else {
      return CustomBtn(
        text: AppStrings.next,
        onpressed: () {
          controller.nextPage(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        },
      );
    }
  }
}
