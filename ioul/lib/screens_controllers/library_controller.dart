import '../screen_views/library_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class Library extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Library({Key? key}) : super(key: key);

  @override
  LibraryController createState() => LibraryController();
}

class LibraryController extends State<Library> {

  //... //Initialization code, state vars etc, all go here
  TextEditingController searchController = TextEditingController();
  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LibraryView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}