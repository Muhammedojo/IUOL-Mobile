import '../screen_views/test_brief_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';


class TestBrief extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const TestBrief({Key? key}) : super(key: key);

  @override
  TestBriefController createState() => TestBriefController();
}

class TestBriefController extends State<TestBrief> {

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
  Widget build(BuildContext context) => TestBriefView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}