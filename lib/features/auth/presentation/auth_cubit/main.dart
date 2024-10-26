import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:murshid/app/murshid_app.dart';
import 'package:murshid/core/database/cache/cache_helper.dart';
import 'package:murshid/core/functions/check_state_changes.dart';
import 'package:murshid/core/services/service_located.dart';
import 'package:murshid/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  checkStateChanges();
  runApp(const Murshid());
}
