import 'package:murshid/core/database/cache/cache_helper.dart';
import 'package:murshid/core/services/service_located.dart';

void onBoardingVisited() {
  getIt<CacheHelper>().saveData(key: "isOnBoardingVisited", value: true);
}
