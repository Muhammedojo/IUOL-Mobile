import '../screen_views/help_desk_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class HelpDesk extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const HelpDesk({Key? key}) : super(key: key);

  @override
  HelpDeskController createState() => HelpDeskController();
}

class HelpDeskController extends State<HelpDesk> {

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
  Widget build(BuildContext context) => HelpDeskView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}