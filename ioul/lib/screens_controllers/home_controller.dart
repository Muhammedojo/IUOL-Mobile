import '../helpers/helper.dart';
import '../screen_views/home_view.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';

class Home extends StatefulWidget {
 // static const routeName = Strings.SCREEN_BLANK;
 final StatefulNavigationShell navigationShell;

  const Home({Key? key, required this.navigationShell}) : super(key: key);

  @override
  HomeController createState() => HomeController();
}

class HomeController extends State<Home> {

  //... //Initialization code, state vars etc, all go here
  int selectedPage = 0;

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

  void setCurrentIndex(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

  onChipSelected(int index) {
    setState(() {
      selectedPage = index;
    });
  }

}