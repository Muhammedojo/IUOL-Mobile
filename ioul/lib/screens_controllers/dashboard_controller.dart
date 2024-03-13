import 'package:flutter/cupertino.dart';
import '../screen_views/dashboard_view.dart';
import '../helpers/helper.dart';
import '../screens/screens.dart';

class Dashboard extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;
  //final UserData user;

  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  DashboardController createState() => DashboardController();
}

class DashboardController extends State<Dashboard> {
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
  Widget build(BuildContext context) => DashboardView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  notificationPage() {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => const Notifications(),
      ),
    );
  }
}
