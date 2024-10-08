import 'package:flutter/material.dart';
import 'package:murshid/core/utils/app_assets.dart';

class ForgetPasswordImage extends StatelessWidget {
  const ForgetPasswordImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: 235,
      child: Image.asset(Assets.assetsImagesForgotPassword),
    );
  }
}
