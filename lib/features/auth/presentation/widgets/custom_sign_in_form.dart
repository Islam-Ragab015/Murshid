import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murshid/core/functions/custom_toast.dart';
import 'package:murshid/core/functions/navigation.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/widgets/custom_btn.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:murshid/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:murshid/features/auth/presentation/widgets/forget_password_text_widget.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInSuccsessState) {
          FirebaseAuth.instance.currentUser!.emailVerified
              ? customReplacementNavigate(context, '/home')
              : showToast(" Please Verify Your Email. ");
        } else if (state is SignInFailureState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

        return Form(
          key: authCubit.signInFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    authCubit.obscurePasswordText();
                  },
                ),
                obscureText: authCubit.obscurePasswordTextValue,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              const ForgetPasswordTextWidget(),
              const SizedBox(
                height: 102,
              ),
              state is SignInLoadingState
                  ? CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                  : CustomBtn(
                      onpressed: () {
                        if (authCubit.signInFormKey.currentState!.validate()) {
                          authCubit.signInWithEmailAndPassword();
                        }
                      },
                      text: AppStrings.signIn),
            ],
          ),
        );
      },
    );
  }
}
