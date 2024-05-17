import '../helpers/helper.dart';
import '../model/model.dart';
import '../screen_views/course_detail_overview_view.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';

class CourseDetailOverview extends StatefulWidget {
  final Course? course;

  const CourseDetailOverview({Key? key, this.course}) : super(key: key);

  @override
  CourseOverviewController createState() => CourseOverviewController();
}

class CourseOverviewController extends State<CourseDetailOverview> {
  //... //Initialization code, state vars etc, all go here
  int selectedPage = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CourseOverviewView(this);

  //Control logic grouped together, at top of file
  onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  onChipSelected(int index) {
    setState(() {
      selectedPage = index;
    });
  }
}
