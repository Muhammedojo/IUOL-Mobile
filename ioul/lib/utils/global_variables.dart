import 'package:flutter/material.dart';

class GlobalVariables {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorCourseKey =
      GlobalKey<NavigatorState>(debugLabel: 'Course');
  final shellNavigatorAssignmentKey =
      GlobalKey<NavigatorState>(debugLabel: 'Assignment');
  final shellNavigatorReportKey =
      GlobalKey<NavigatorState>(debugLabel: 'Report');
  final shellNavigatorMoreKey = GlobalKey<NavigatorState>(debugLabel: 'More');
}
