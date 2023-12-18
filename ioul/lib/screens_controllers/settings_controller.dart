import '../screen_views/settings_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class Settings extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Settings({Key? key}) : super(key: key);

  @override
  SettingsController createState() => SettingsController();
}

class SettingsController extends State<Settings> {

  //... //Initialization code, state vars etc, all go here
  bool onNotification = true;

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SettingsView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }
onSwitch(value){
  setState(() => onNotification = value);
}

}