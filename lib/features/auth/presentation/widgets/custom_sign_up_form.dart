import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/widgets/custom_btn.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:murshid/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:murshid/features/auth/presentation/widgets/terms_and_conditions_widget.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);

        return Form(
          key: authCubit.signUpFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (fristName) {
                  authCubit.firstName = fristName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
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
              const TermsAndConditions(),
              const SizedBox(
                height: 88,
              ),
              CustomBtn(
                  color:
                      authCubit.updateTermsAndConditionsCheckBoxValue == false
                          ? AppColors.grey
                          : null,
                  onpressed: () {
                    if (authCubit.updateTermsAndConditionsCheckBoxValue ==
                        true) {
                      if (authCubit.signUpFormKey.currentState!.validate()) {
                        authCubit.signUpWithEmailAndPasswoed();
                      }
                    }
                  },
                  text: AppStrings.signUp),
            ],
          ),
        );
      },
    );
  }
}
