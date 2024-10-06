import 'package:flutter/material.dart';
import 'package:murshid/core/functions/navigation.dart';
import 'package:murshid/features/on_boarding/presentation/views/functions/on_boarding.dart';
import 'package:murshid/features/on_boarding/presentation/views/widgets/cusom_nav_bar.dart';
import 'package:murshid/features/on_boarding/presentation/views/widgets/get_buttons.dart';
import 'package:murshid/features/on_boarding/presentation/views/widgets/on_bording_widget_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _controller = PageController(initialPage: 0);
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 40,
              ),
              CustomNavBar(onTap: () {
                onBoardingVisited();
                customReplacementNavigate(context, "/signUp");
              }),
              OnBoardingWidgetBody(
                onPageChanged: (int index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                controller: _controller,
              ),
              const SizedBox(height: 88),
              GetButton(
                currentIndex: currentPage,
                controller: _controller,
              ),
              const SizedBox(
                height: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
