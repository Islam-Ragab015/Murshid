import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      side: BorderSide(color: AppColors.grey),
      value: value,
      onChanged: (newValue) {
        if (newValue != null) {
          setState(() {
            value = newValue;
            BlocProvider.of<AuthCubit>(context)
                .updateTermsAndConditionsCheckBox(newvalue: newValue);
          });
        }
      },
    );
  }
}
