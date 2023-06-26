import '../helpers/helper.dart';
import '../screen_views/course_view.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';

class Course extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Course({Key? key}) : super(key: key);

  @override
  CourseController createState() => CourseController();
}

class CourseController extends State<Course> {
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
  Widget build(BuildContext context) => CourseView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
