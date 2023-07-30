import '../screen_views/about_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class About extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const About({Key? key}) : super(key: key);

  @override
  AboutController createState() => AboutController();
}

class AboutController extends State<About> {

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
  Widget build(BuildContext context) => AboutView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}