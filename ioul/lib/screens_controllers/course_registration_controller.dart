import '../screen_views/course_registration_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class CourseRegistration extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const CourseRegistration({Key? key}) : super(key: key);

  @override
  CourseRegistrationController createState() => CourseRegistrationController();
}

class CourseRegistrationController extends State<CourseRegistration> {

  //... //Initialization code, state vars etc, all go here

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CourseRegistrationView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}