import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:murshid/features/auth/presentation/views/forget_password_view.dart';
import 'package:murshid/features/auth/presentation/views/sign_in_view.dart';
import 'package:murshid/features/auth/presentation/views/sign_up_view.dart';
import 'package:murshid/features/home/data/models/historical_periods_model.dart';
import 'package:murshid/features/home/presentation/views/historical_periods_details_view.dart';
import 'package:murshid/features/home/presentation/widgets/home_nav_bar_widget.dart';
import 'package:murshid/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:murshid/features/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SplashView()),
  GoRoute(
      path: '/onBoarding', builder: (context, state) => const OnBoardingView()),
  GoRoute(
      path: '/signUp',
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignUpView(),
          )),
  GoRoute(
      path: '/signIn',
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignInView(),
          )),
  GoRoute(
    path: '/forgetPassword',
    builder: (context, state) => BlocProvider(
      create: (context) => AuthCubit(),
      child: const ForgetPasswordView(),
    ),
  ),
  GoRoute(
    path: '/homeNavBar',
    builder: (context, state) => const HomeNavBarWidget(),
  ),
  GoRoute(
    path: '/HistoricalPeriodsDetailsView',
    builder: (context, state) => HistoricalPeriodsDetailsView(
      model: state.extra as HistoricalPeriodsModel,
    ),
  ),
]);
