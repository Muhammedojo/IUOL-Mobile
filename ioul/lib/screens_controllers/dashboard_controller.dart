import 'package:flutter/cupertino.dart';
import '../core/core.dart';
import '../screen_views/dashboard_view.dart';
import '../screens/screens.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    Key? key,
  }) : super(key: key);

  @override
  DashboardController createState() => DashboardController();
}

class DashboardController extends State<Dashboard> {
  //... //Initialization code, state vars etc, all go here
  late final UserCubit userCubit;

  @override
  void initState() {
    userCubit = context.read<UserCubit>();
    userCubit.loadUser();
    context.read<UpcomingTaskCubit>().loadTasksFromServer();
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

  String extractLetters(String input) {
    if (input.isEmpty) {
      return '';
    }

    final firstSpaceIndex = input.indexOf(' ');

    if (firstSpaceIndex == -1 || firstSpaceIndex == input.length - 1) {
      return input.substring(0, 1);
    }

    return input.substring(0, 1) + input[firstSpaceIndex + 1];
  }

  refresh() {
    context.read<UpcomingTaskCubit>().loadTasksFromServer();
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
