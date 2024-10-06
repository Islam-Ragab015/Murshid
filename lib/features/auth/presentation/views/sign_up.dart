import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/utils/app_text_styles.dart';
import 'package:murshid/core/widgets/custom_btn.dart';
import 'package:murshid/core/widgets/custom_text_field.dart';
import 'package:murshid/core/widgets/terms_and_condition_widget.dart';
import 'package:murshid/features/auth/presentation/widgets/welcome_text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 150,
              ),
            ),
            const SliverToBoxAdapter(
              child: WlcomeTextWidget(text: AppStrings.welcome),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.fristName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.fristName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.lastName,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.emailAddress,
              ),
            ),
            const SliverToBoxAdapter(
              child: CustomTextField(
                labelText: AppStrings.password,
              ),
            ),
            const SliverToBoxAdapter(
              child: TermsAndCondition(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 88,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomBtn(onpressed: () {}, text: AppStrings.signUp),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            const SliverToBoxAdapter(
              child: HaveAnAccount(
                  text1: AppStrings.alreadyHaveAnAccount,
                  text2: AppStrings.signUp),
            ),
          ],
        ),
      ),
    );
  }
}

class HaveAnAccount extends StatelessWidget {
  const HaveAnAccount({super.key, required this.text1, required this.text2});
  final String text1, text2;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text.rich(TextSpan(children: [
        TextSpan(
          text: text1,
          style: CustomTextStyles.poppins400style12,
        ),
        TextSpan(
          text: text2,
          style: CustomTextStyles.poppins400style12
              .copyWith(color: AppColors.lightGrey),
        ),
      ])),
    );
  }
}
