import 'package:flutter/material.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/course_registration_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class CourseRegistrationView extends StatelessView<CourseRegistration, CourseRegistrationController> {
  const CourseRegistrationView(CourseRegistrationController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child:_body())
    );
  }
  Widget _body() {
    return const SizedBox();
  }
}
