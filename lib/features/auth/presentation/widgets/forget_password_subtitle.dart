import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_strings.dart';
import 'package:murshid/core/utils/app_text_styles.dart';

class ForgetPasswordSubtitle extends StatelessWidget {
  const ForgetPasswordSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Text(
        textAlign: TextAlign.center,
        AppStrings.enterRegisteredEmail,
        style: CustomTextStyles.poppins400style12.copyWith(fontSize: 14),
      ),
    );
  }
}
