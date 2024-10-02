import 'package:flutter/material.dart';
import 'package:murshid/core/database/cache/cache_helper.dart';
import 'package:murshid/core/routes/app_router.dart';
import 'package:murshid/core/services/service_located.dart';
import 'package:murshid/core/utils/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(const Murshid());
}

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
