import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:murshid/core/services/service_located.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:murshid/features/auth/presentation/views/sign_in_view.dart';
import 'package:murshid/features/auth/presentation/views/sign_up_view.dart';
import 'package:murshid/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:murshid/features/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SplashView()),
  GoRoute(
      path: '/onBoarding', builder: (context, state) => const OnBoardingView()),
  GoRoute(
      path: '/signUp',
      builder: (context, state) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignUpView(),
          )),
  GoRoute(
      path: '/signIn',
      builder: (context, state) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const SignInView(),
          )),
]);
