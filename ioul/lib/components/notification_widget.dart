import '../packages/package.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Test for International Policy has been scheduled. Go to the test portal to attempt your test before the closing date.',
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff1A1F36))),
          SizedBox(
            height: 16.h,
          ),
          Text('Today at 9:42 AM',
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: 'Inter',
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
