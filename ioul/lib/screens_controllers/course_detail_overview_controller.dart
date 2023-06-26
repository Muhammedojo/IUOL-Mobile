import '../helpers/helper.dart';
import '../screen_views/course_detail_overview_view.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';

class CourseOverview extends StatefulWidget {

  const CourseOverview({Key? key}) : super(key: key);

  @override
  CourseOverviewController createState() => CourseOverviewController();
}

class CourseOverviewController extends State<CourseOverview> {
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
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  onChipSelected(int index) {
    setState(() {
      selectedPage = index;
    });
  }
}
