import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/notification_controller.dart';
import '../core/core.dart';
import '../core/utils/mvc.dart';

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
            BlocBuilder<NotificationCubit, NotificationState>(
                builder: (context, stateBloc) {
              if (stateBloc is NotificationLoading) {
                return const Loader();
              } else if (stateBloc is NotificationLoaded) {
                return stateBloc.notificationList.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: stateBloc.notificationList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          var notifications = stateBloc.notificationList[index];
                          return NotificationWidget(
                            notification: notifications,
                          );
                        })
                    : ErrorItemWidget(
                        title: "empty_list".tr(),
                        message: "notification_list_empty".tr(),
                        hideButton: false,
                        onTap: () {
                          state.refresh();
                        },
                      );
              }
              return ErrorItemWidget(
                title: "error_occurred".tr(),
                message: "Couldn't fetch notification",
                hideButton: false,
                onTap: () {
                  state.refresh();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
