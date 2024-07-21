import '../../../../core/core.dart';
import '../view/add_drop_course_view.dart';

class AddDropCourse extends StatefulWidget {
  const AddDropCourse({Key? key}) : super(key: key);

  @override
  AddDropCourseController createState() => AddDropCourseController();
}

class AddDropCourseController extends State<AddDropCourse> {
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
  Widget build(BuildContext context) => AddDropCourseView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
