import '../screen_views/test_reset_reason_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class TestResetReason extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const TestResetReason({Key? key}) : super(key: key);

  @override
  TestResetReasonController createState() => TestResetReasonController();
}

class TestResetReasonController extends State<TestResetReason> {

  //... //Initialization code, state vars etc, all go here
  final TextEditingController resetReasonController = TextEditingController();
  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TestResetReasonView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}