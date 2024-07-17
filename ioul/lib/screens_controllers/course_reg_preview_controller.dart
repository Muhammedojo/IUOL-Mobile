import '../core/core.dart';
import '../screen_views/course_reg_preview_view.dart';

class CourseRegistrationPreview extends StatefulWidget {
  const CourseRegistrationPreview(
      {Key? key, required this.selectedObjects, required this.semesterRegId})
      : super(key: key);

  final List<SummaryCourse> selectedObjects;
  final int semesterRegId;

  @override
  CourseRegistrationPreviewController createState() =>
      CourseRegistrationPreviewController();
}

class CourseRegistrationPreviewController
    extends State<CourseRegistrationPreview> {
  //... //Initialization code, state vars etc, all go here

  List<SummaryCourse> selectedCourses = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CourseRegistrationPreviewView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  sendRegisteredCourseToServer() async {
    try {
      var courseReg = SubmitCourseReg();

      List<int> getSelectedCourseIds() {
        return widget.selectedObjects
            .where((course) => course.id != null)
            .map((course) => course.id!)
            .toList();
      }

      List<int> selectedIds = getSelectedCourseIds();

      courseReg.courseIds = selectedIds;
      courseReg.semesterRegId = widget.semesterRegId;
      context.read<CourseRegCubit>().pushCourseRegToServer(courseReg);
    } catch (e) {}
  }
}
