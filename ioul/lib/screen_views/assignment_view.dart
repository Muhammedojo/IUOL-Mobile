import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../components/components.dart';
import '../screens_controllers/assignment_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class AssignmentView extends StatelessView<Assignment, AssignmentController> {
  const AssignmentView(AssignmentController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
            backgroundColor: const Color(0xff25435B),
            centerTitle: true,
            title: const Text(
              'Enrolled Courses',
            )),
        body: const WidgetWrapper(
            child: Center(
          child: Text("Assignment"),
        )));
  }
}
