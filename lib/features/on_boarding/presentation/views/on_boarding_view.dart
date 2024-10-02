import 'package:flutter/material.dart';
import 'package:murshid/features/on_boarding/presentation/views/widgets/cusom_nav_bar.dart';
import 'package:murshid/features/on_boarding/presentation/views/widgets/on_bording_widget_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 20,
              ),
              const CustomNavBar(),
              OnBoardingWidgetBody(),
            ],
          ),
        ),
      ),
    );
  }
}
