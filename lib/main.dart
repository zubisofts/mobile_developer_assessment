import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mobile_assessment/core/db/app_database.dart';
import 'package:mobile_assessment/root_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppDatabase.initDB();
  runZonedGuarded(() async {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    runApp(const MobileAssessmentApp(
      isDebug: true,
    ));
  }, (exception, stackTrace) async {});
}

