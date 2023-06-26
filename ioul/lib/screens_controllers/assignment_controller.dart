import '../helpers/helper.dart';
import '../screen_views/assignment_view.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';

class Assignment extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Assignment({Key? key}) : super(key: key);

  @override
  AssignmentController createState() => AssignmentController();
}

class AssignmentController extends State<Assignment> {
  //... //Initialization code, state vars etc, all go here

  @override
  void initState() {
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
}
