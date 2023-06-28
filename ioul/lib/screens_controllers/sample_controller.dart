import '../screen_views/sample_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class Blank extends StatefulWidget {
 // static const routeName = Strings.SCREEN_BLANK;

  const Blank({Key? key}) : super(key: key);

  @override
  BlankController createState() => BlankController();
}

class BlankController extends State<Blank> {

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
  Widget build(BuildContext context) => BlankView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}