import '../screen_views/test_list_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../screens/screens.dart';


class TestList extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const TestList({Key? key}) : super(key: key);

  @override
  TestListController createState() => TestListController();
}

class TestListController extends State<TestList> {

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
  Widget build(BuildContext context) => TestListView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

  goToTestBrief() => Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const TestBrief()),
  );

}