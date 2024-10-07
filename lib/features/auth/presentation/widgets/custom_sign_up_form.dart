import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return Form(
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (fristName) {
                  BlocProvider.of<AuthCubit>(context).firstName = fristName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  BlocProvider.of<AuthCubit>(context).lastName = lastName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  BlocProvider.of<AuthCubit>(context).emailAddress =
                      emailAddress;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                onChanged: (password) {
                  BlocProvider.of<AuthCubit>(context).password = password;
                },
              ),
              const TermsAndConditions(),
              const SizedBox(
                height: 88,
              ),
              CustomBtn(
                  onpressed: () {
                    BlocProvider.of<AuthCubit>(context)
                        .signUpWithEmailAndPasswoed();
                  },
                  text: AppStrings.signUp),
            ],
          ),
        );
      },
    );
  }
}
