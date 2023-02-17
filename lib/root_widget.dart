import 'package:flutter/material.dart';
import 'package:mobile_assessment/core/navigation/routes.dart';
import 'package:mobile_assessment/utils/app_theme.dart';

class MobileAssessmentApp extends StatefulWidget {
  final bool isDebug;
  const MobileAssessmentApp({Key? key, this.isDebug = true}) : super(key: key);

  @override
  State<MobileAssessmentApp> createState() => _MobileAssessmentAppState();
}

class _MobileAssessmentAppState extends State<MobileAssessmentApp> {
  late GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: widget.isDebug,
        routeInformationProvider: routes.routeInformationProvider,
        routeInformationParser: routes.routeInformationParser,
        routerDelegate: routes.routerDelegate,
        darkTheme: AppTheme.darkTheme(),
        theme: AppTheme.lightTheme());
  }
}
