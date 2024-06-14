import '../core/core.dart';
import '../screen_views/course_registration_view.dart';

class CourseRegistration extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const CourseRegistration({Key? key}) : super(key: key);

  @override
  CourseRegistrationController createState() => CourseRegistrationController();
}

class CourseRegistrationController extends State<CourseRegistration> {
  //... //Initialization code, state vars etc, all go here
  late final CourseRegCubit initCourseRegCubit;
  List<int> selectedCourses = [];
  @override
  void initState() {
    super.initState();
    context.read<CourseRegCubit>().initCourseRegistration();
  }

  void toggleSelection(int id) {
    setState(() {
      if (selectedCourses.contains(id)) {
        selectedCourses.remove(id);
      } else {
        selectedCourses.add(id);
      }
    });
    // print('Selected: ${id}');
    // print('Selected: ${selectedCourses.toString()}');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CourseRegistrationView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  refresh() {
    if (mounted) {
      context.read<CourseRegCubit>().initCourseRegistration();
    }
  }
}
