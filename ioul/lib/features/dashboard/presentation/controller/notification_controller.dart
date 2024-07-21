import '../../../../core/core.dart';
import '../bloc/bloc.dart';
import '../view/notification_view.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  NotificationController createState() => NotificationController();
}

class NotificationController extends State<Notifications> {
  //... //Initialization code, state vars etc, all go here

  @override
  void initState() {
    context.read<NotificationCubit>().loadNotificationsFromServer();
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

  refresh() {
    context.read<NotificationCubit>().loadNotificationsFromServer();
  }
}
