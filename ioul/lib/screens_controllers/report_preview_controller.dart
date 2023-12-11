import '../screen_views/report_preview_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class ReportPreview extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ReportPreview({Key? key}) : super(key: key);

  @override
  ReportPreviewController createState() => ReportPreviewController();
}

class ReportPreviewController extends State<ReportPreview> {

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
  Widget build(BuildContext context) => ReportPreviewView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}