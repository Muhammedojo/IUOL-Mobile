import '../screen_views/examination_extension_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class ExaminationExtension extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ExaminationExtension({Key? key}) : super(key: key);

  @override
  ExaminationExtensionController createState() => ExaminationExtensionController();
}

class ExaminationExtensionController extends State<ExaminationExtension> {

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
  Widget build(BuildContext context) => ExaminationExtensionView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}