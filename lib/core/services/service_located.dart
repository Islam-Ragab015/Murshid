import 'package:get_it/get_it.dart';
import 'package:murshid/core/database/cache/cache_helper.dart';
import 'package:murshid/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
