import '../screen_views/ioul_library_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class IOULLibrary extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const IOULLibrary({Key? key}) : super(key: key);

  @override
  IOULLibraryController createState() => IOULLibraryController();
}

class IOULLibraryController extends State<IOULLibrary> {

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
  Widget build(BuildContext context) => IOULLibraryView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}