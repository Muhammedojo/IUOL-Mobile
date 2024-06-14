import '../screen_views/pending_application_view.dart';
import 'package:flutter/material.dart';
import '../core/helpers/helper.dart';

class PendingApplication extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const PendingApplication({Key? key}) : super(key: key);

  @override
  PendingApplicationController createState() => PendingApplicationController();
}

class PendingApplicationController extends State<PendingApplication> {
  //... //Initialization code, state vars etc, all go here

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PendingApplicationView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
