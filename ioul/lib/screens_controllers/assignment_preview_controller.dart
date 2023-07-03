import '../screen_views/assignment_preview_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class AssignmentPreview extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const AssignmentPreview({Key? key}) : super(key: key);

  @override
  AssignmentPreviewController createState() => AssignmentPreviewController();
}

class AssignmentPreviewController extends State<AssignmentPreview> {

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
  Widget build(BuildContext context) => AssignmentPreviewView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}