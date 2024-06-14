import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/notification_controller.dart';
import '../core/core.dart';
import 'stateless_view.dart';

class NotificationView
    extends StatelessView<Notifications, NotificationController> {
  const NotificationView(NotificationController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: WidgetHelper().appBackArrowWithTitle(context,
            title: 'notification'.tr(), onTap: () => state.onBackPressed()),
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var note = Notificationss();
                  return NotificationWidget(
                    notification: note,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
