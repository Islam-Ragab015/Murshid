import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/features/auth/presentation/widgets/custom_forget_password_form.dart';
import 'package:murshid/features/auth/presentation/widgets/forget_password_image.dart';
import 'package:murshid/features/auth/presentation/widgets/forget_password_subtitle.dart';
import 'package:murshid/features/auth/presentation/widgets/welcome_text_widget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 108,
            ),
          ),
          SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.forgotPassword),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          SliverToBoxAdapter(
            child: ForgetPasswordImage(),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 24,
            ),
          ),
          SliverToBoxAdapter(
            child: ForgetPasswordSubtitle(),
          ),
          SliverToBoxAdapter(
            child: CustomForgetPasswordForm(),
          ),
        ],
      ),
    );
  }
}
