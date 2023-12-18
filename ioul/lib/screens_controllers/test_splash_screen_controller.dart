import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:ioul/screens/screens.dart';

import '../screen_views/test_splash_screen_view.dart';
import '../helpers/helper.dart';

class TestSplashScreen extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const TestSplashScreen({Key? key}) : super(key: key);

  @override
  TestSplashScreenController createState() => TestSplashScreenController();
}

class TestSplashScreenController extends State<TestSplashScreen> {

  //... //Initialization code, state vars etc, all go here

  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),
    ()=>Navigator.pushReplacement(context,CupertinoPageRoute(builder:(context) => const TestOverview())));
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => TestSplashScreenView(this);




  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}