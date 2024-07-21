import '../../../../core/core.dart';
import '../bloc/bloc.dart';
import '../view/course_registration_view.dart';

class CourseRegistration extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const CourseRegistration({Key? key}) : super(key: key);

  @override
  CourseRegistrationController createState() => CourseRegistrationController();
}

class CourseRegistrationController extends State<CourseRegistration> {
  //... //Initialization code, state vars etc, all go here
  late final CourseRegCubit initCourseRegCubit;
  List<SummaryCourse> selectedCourses = [];

  int totalUnits = 0;

  @override
  void initState() {
    super.initState();
    context.read<CourseRegCubit>().initCourseRegistration();
  }

  void toggleSelection(SummaryCourse course) {
    setState(() {
      if (selectedCourses.contains(course)) {
        selectedCourses.remove(course);
      } else {
        selectedCourses.add(course);
      }
      //totalUnits = selectedCourses.fold(0, (sum, course) => sum + int.parse(course.units));
    });
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
