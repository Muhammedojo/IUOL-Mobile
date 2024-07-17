import '../core/core.dart';

class PreviewCourseRegWidget extends StatelessWidget {
  final SummaryCourse course;
  const PreviewCourseRegWidget({Key? key, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 3.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 1.0), // shadow direction: bottom right
          ),
        ],
      ),
      child: Padding(
        padding: REdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '${course.code}-${course.title}',
                  style: TextStyle(
                      fontFamily: Styles.font,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff090A0A),
                      fontSize: 14.sp),
                ),
              ],
            ),
            Text(
              '${course.units} Unit',
              style: TextStyle(
                  fontFamily: Styles.font,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff72777A),
                  fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
