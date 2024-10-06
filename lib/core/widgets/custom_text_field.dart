import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.labelText});
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 24),
      child: TextField(
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: CustomTextStyles.poppins500style18,
            border: getBorderStyile(),
            enabledBorder: getBorderStyile(),
            focusedBorder: getBorderStyile()),
      ),
    );
  }
}

OutlineInputBorder getBorderStyile() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: AppColors.grey),
    );
