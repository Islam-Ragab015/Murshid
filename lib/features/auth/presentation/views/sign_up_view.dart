import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/features/auth/presentation/widgets/custom_sign_up_form.dart';
import 'package:murshid/features/auth/presentation/widgets/have_an_account.dart';
import 'package:murshid/features/auth/presentation/widgets/welcome_text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: SizedBox(
                height: 150,
              ),
            ),
            SliverToBoxAdapter(
              child: WlcomeTextWidget(text: AppStrings.welcome),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomSignUpForm(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: HaveAnAccount(
                  text1: AppStrings.alreadyHaveAnAccount,
                  text2: AppStrings.signIn),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),
          ],
        ),
      ),
    );
  }
}
