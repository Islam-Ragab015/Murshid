import 'package:flutter/material.dart';
import 'package:murshid/core/functions/navigation.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/features/auth/presentation/widgets/custom_sign_up_form.dart';
import 'package:murshid/features/auth/presentation/widgets/have_an_account.dart';
import 'package:murshid/features/auth/presentation/widgets/welcome_text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
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
              child: CustomSignUpForm(),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: HaveAnAccount(
                  text1: AppStrings.alreadyHaveAnAccount,
                  text2: AppStrings.signIn,
                  onTap: () {
                    customReplacementNavigate(context, "/signIn");
                  }),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 16,
            )),
          ],
        ),
      ),
    );
  }
}
