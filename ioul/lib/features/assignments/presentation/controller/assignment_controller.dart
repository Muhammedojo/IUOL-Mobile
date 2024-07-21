import 'package:flutter/cupertino.dart';
import '../../../../core/core.dart';
import '../bloc/bloc.dart';
import '../view/assignment_view.dart';
import 'assignment_preview_controller.dart';

class Assignments extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Assignments({Key? key}) : super(key: key);

  @override
  AssignmentController createState() => AssignmentController();
}

class AssignmentController extends State<Assignments> {
  //... //Initialization code, state vars etc, all go here

  @override
  void initState() {
    context.read<AssignmentCubit>().loadCourseAssignmentFromServer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AssignmentView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  refresh() {
    context.read<AssignmentCubit>().loadCourseAssignmentFromServer();
  }

  showAssignmentPreview(AssignmentSummary assignment) async {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => AssignmentPreview(
                  assignment: assignment,
                )));
  }
}
