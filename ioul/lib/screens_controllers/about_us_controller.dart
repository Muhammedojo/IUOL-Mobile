import 'package:flutter/material.dart';
import '../core/helpers/helper.dart';
import '../screen_views/about_us_view.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  AboutUsController createState() => AboutUsController();
}

class AboutUsController extends State<AboutUs> {
  //... //Initialization code, state vars etc, all go here
  bool onNotification = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AboutUsView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  onSwitch(value) {
    setState(() => onNotification = value);
  }
}
