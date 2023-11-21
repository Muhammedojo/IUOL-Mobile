import '../screen_views/result_history_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class ResultHistory extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ResultHistory({Key? key}) : super(key: key);

  @override
  ResultHistoryController createState() => ResultHistoryController();
}

class ResultHistoryController extends State<ResultHistory> {

  //... //Initialization code, state vars etc, all go here
  String selectedValue = "";
  final TextEditingController dropdownController = TextEditingController();

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ResultHistoryView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}