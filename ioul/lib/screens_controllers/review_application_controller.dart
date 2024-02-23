import '../screen_views/review_application_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class ReviewApplication extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ReviewApplication({Key? key}) : super(key: key);

  @override
  ReviewApplicationController createState() => ReviewApplicationController();
}

class ReviewApplicationController extends State<ReviewApplication> {
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
  Widget build(BuildContext context) => ReviewApplicationView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
