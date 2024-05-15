import 'package:flutter/material.dart';

import '../model/model.dart';

class GlobalVariables {
  String? appLanguage = "en";
  List<Locale> appLocales = [
    const Locale('en', 'US'),
    const Locale('fr', 'FR'),
    const Locale('sw', 'TZ')
  ];
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorDashboardKey =
      GlobalKey<NavigatorState>(debugLabel: 'Dashboard');
  final shellNavigatorCourseKey =
      GlobalKey<NavigatorState>(debugLabel: 'Course');
  final shellNavigatorAssignmentKey =
      GlobalKey<NavigatorState>(debugLabel: 'Assignment');
  final shellNavigatorReportKey =
      GlobalKey<NavigatorState>(debugLabel: 'Report');
  final shellNavigatorMoreKey = GlobalKey<NavigatorState>(debugLabel: 'More');

  SubmitApplication application = SubmitApplication();

  static ValueNotifier<SubmitApplication> applications =
      ValueNotifier(SubmitApplication());
}
