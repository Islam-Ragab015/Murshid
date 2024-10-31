import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:murshid/core/utils/app_assets.dart';
import 'package:murshid/core/utils/app_colors.dart';
import 'package:murshid/features/cart/presentaion/views/cart_view.dart';
import 'package:murshid/features/home/presentation/cubit/home_cubit.dart';
import 'package:murshid/features/home/presentation/views/home_view.dart';
import 'package:murshid/features/profile/presentation/views/profile_view.dart';
import 'package:murshid/features/search/presentaion/views/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

PersistentTabController _controller = PersistentTabController();

class HomeNavBarWidget extends StatelessWidget {
  const HomeNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      navBarStyle: NavBarStyle.style12,
      backgroundColor: AppColors.primaryColor,
      decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      )),
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInExpo,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.slide,
        ),
      ),
      confineToSafeArea: true,
    );
  }
}

List<Widget> _buildScreens() {
  return [
    BlocProvider(
      create: (context) => HomeCubit()..getHistoricalPeriods(),
      child: const HomeView(),
    ),
    const CartView(),
    const SearchView(),
    const ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    // Home
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesHomeIconActive),
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesHomeIcon),
      title: ("Home"),
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.grey,
    ),
    // Cart
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesShoppingCartActive),
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesShoppingCart),
      title: ("Cart"),
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.grey,
    ),
    // Search
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesSearchActive),
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesSearch),
      title: ("Search"),
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.grey,
    ),
    // Profile
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(Assets.assetsImagesPersonActive),
      inactiveIcon: SvgPicture.asset(Assets.assetsImagesPerson),
      title: ("Profile"),
      activeColorPrimary: Colors.white,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}
