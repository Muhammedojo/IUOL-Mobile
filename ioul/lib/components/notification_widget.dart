import '../model/model.dart';
import '../packages/package.dart';
import '../values/values.dart';

class NotificationWidget extends StatelessWidget {
  final Notificationss notification;
  const NotificationWidget({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${notification.message}',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: Styles.font,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff1A1F36))),
          SizedBox(
            height: 16.h,
          ),
          Text('${notification.date}',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: Styles.font,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff979C9E))),
          SizedBox(
            height: 12.h,
          ),
        ],
      ),
    );
  }
}
