import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murshid/core/functions/custom_toast.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/widgets/custom_btn.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:murshid/features/auth/presentation/widgets/custom_text_field.dart';

class CustomForgetPasswordForm extends StatelessWidget {
  const CustomForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is PasswordResetEmailSentState) {
          // Show a success toast when the password reset email is sent
          showToast("Password reset link sent to your email.");
        } else if (state is SignInFailureState) {
          showToast(
            state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: authCubit.signInFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (emailAddress) {
                    authCubit.emailAddress = emailAddress;
                  },
                ),
                const SizedBox(
                  height: 129,
                ),
                state is SignInLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomBtn(
                        onpressed: () {
                          if (authCubit.signInFormKey.currentState!
                              .validate()) {
                            authCubit.sendPasswordResetEmail();
                          }
                        },
                        text: AppStrings.sendResentPasswordLink,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
