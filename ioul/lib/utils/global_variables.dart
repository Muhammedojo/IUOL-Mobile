import 'package:flutter/material.dart';

import '../model/model.dart';

class GlobalVariables {
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
