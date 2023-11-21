import '../screen_views/test_reset_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class TestReset extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const TestReset({Key? key}) : super(key: key);

  @override
  TestResetController createState() => TestResetController();
}

class TestResetController extends State<TestReset> {

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
  Widget build(BuildContext context) => TestResetView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}