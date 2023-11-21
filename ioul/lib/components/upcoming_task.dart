import '../packages/package.dart';

class UpcomingTaskWidget extends StatelessWidget {
  final Function()? onTap;
  final String course;
  final String date;
  const UpcomingTaskWidget(
      {Key? key, required this.onTap, required this.course, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.1,
            ),
          ],
        ),
        child: Padding(
            padding: REdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(course,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff090A0A))),
                  ],
                ),
                Row(
                  children: [
                    Text('Due on $date',
                        //'CMP 111 - Introduction to Computer Science',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff72777A))),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
