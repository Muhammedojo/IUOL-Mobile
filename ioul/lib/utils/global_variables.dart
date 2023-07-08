import 'package:flutter/material.dart';

class GlobalVariables {
  static final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorCourseKey =
      GlobalKey<NavigatorState>(debugLabel: 'Course');
  final shellNavigatorAssignmentKey =
      GlobalKey<NavigatorState>(debugLabel: 'Assignment');
  // final shellNavigatorDashboardKey =
  // GlobalKey<NavigatorState>(debugLabel: 'Dashboard');
  final shellNavigatorReportKey =
      GlobalKey<NavigatorState>(debugLabel: 'Report');
  final shellNavigatorMoreKey = GlobalKey<NavigatorState>(debugLabel: 'More');

  // double initialProgress = (100 / 7 / 100);

  // double get getInitialProgress => initialProgress;

  // set setInitialProgress(double value) {
  //   // setState(() {
  //   initialProgress = getInitialProgress * value;
  //   // });
  //   print(initialProgress);
  // }
}
