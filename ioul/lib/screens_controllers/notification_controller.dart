import '../helpers/helper.dart';
import '../screen_views/notification_view.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';

class Notifications extends StatefulWidget {

  const Notifications({Key? key}) : super(key: key);

  @override
  NotificationController createState() => NotificationController();
}

class NotificationController extends State<Notifications> {
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
  Widget build(BuildContext context) => NotificationView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
