import 'package:flutter/material.dart';
import 'package:murshid/core/routes/app_router.dart';
import 'package:murshid/core/utils/app_colors.dart';

class Murshid extends StatelessWidget {
  const Murshid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: AppColors.offWhite),
      routerConfig: router,
    );
  }
}
