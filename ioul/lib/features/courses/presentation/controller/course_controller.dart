import 'package:flutter/cupertino.dart';

import '../../../../core/core.dart';
import '../bloc/bloc.dart';
import '../view/course_view.dart';
import 'course_detail_overview_controller.dart';

class Courses extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Courses({Key? key}) : super(key: key);

  @override
  CourseController createState() => CourseController();
}

class CourseController extends State<Courses> {
  //... //Initialization code, state vars etc, all go here

  @override
  void initState() {
    context.read<CoursesCubit>().loadCoursesFromServer();
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

  showCourseDetails(Course course) async {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => CourseDetailOverview(
                  course: course,
                )));
  }

  refresh() {
    context.read<CoursesCubit>().loadCoursesFromServer();
  }
}
