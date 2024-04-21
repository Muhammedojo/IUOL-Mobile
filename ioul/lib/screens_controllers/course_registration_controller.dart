import 'package:ioul/packages/package.dart';

import '../bloc/bloc.dart';
import '../screen_views/course_registration_view.dart';

import '../helpers/helper.dart';

class CourseRegistration extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const CourseRegistration({Key? key}) : super(key: key);

  @override
  CourseRegistrationController createState() => CourseRegistrationController();
}

class CourseRegistrationController extends State<CourseRegistration> {
  //... //Initialization code, state vars etc, all go here
  late final CourseRegCubit initCourseRegCubit;

  @override
  void initState() {
    super.initState();
    initCourseRegCubit = context.read<CourseRegCubit>();
    initCourseRegCubit.initCourseRegistration();
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
}
