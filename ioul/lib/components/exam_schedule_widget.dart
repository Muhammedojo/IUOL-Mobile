import '../packages/package.dart';

class ExamScheduleWidget extends StatelessWidget {
  final String course;
  final String time;
  final String date;
  const ExamScheduleWidget(
      {Key? key, required this.course, required this.time, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(course,
            style: TextStyle(
                fontSize: 16.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                color: const Color(0xff090A0A))),
        SizedBox(height: 8.h,),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/calendar.svg',
              height: 24.w,
              width: 24.w,
              fit: BoxFit.scaleDown,
            ),
            Text(date,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff090A0A))),
            const Spacer(),
            SvgPicture.asset(
              'assets/images/clock.svg',
              height: 24.w,
              width: 24.w,
              fit: BoxFit.scaleDown,
            ),
            Text(time,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff090A0A)))
          ],
        )
      ],
    );
  }
}
