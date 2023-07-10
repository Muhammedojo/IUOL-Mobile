import '../values/values.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../packages/package.dart' hide Notification;
import '../screens_controllers/notification_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class NotificationView extends StatelessView<Notification, NotificationController> {
  const NotificationView(NotificationController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        // padding: MediaQuery.of(context).viewInsets,
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
