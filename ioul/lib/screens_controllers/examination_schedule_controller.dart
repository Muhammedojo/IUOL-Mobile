import '../screen_views/examination_schedule_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class ExaminationSchedule extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ExaminationSchedule({Key? key}) : super(key: key);

  @override
  ExaminationScheduleController createState() => ExaminationScheduleController();
}

class ExaminationScheduleController extends State<ExaminationSchedule> {

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
  Widget build(BuildContext context) => ExaminationScheduleView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}