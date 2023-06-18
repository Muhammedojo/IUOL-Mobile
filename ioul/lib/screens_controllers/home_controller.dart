import '../helpers/helper.dart';
import '../screen_views/home_view.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';

class Home extends StatefulWidget {
 // static const routeName = Strings.SCREEN_BLANK;

  const Home({Key? key}) : super(key: key);

  @override
  HomeController createState() => HomeController();
}

class HomeController extends State<Home> {

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
  Widget build(BuildContext context) => HomeView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}