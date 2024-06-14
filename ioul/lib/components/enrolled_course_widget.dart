import '../core/core.dart';

class EnrolledCourseWidget extends StatelessWidget {
  final Function()? onTap;
  final Course course;
  const EnrolledCourseWidget(
      {Key? key, required this.onTap, required this.course})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
          padding: REdgeInsets.all(18.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/images/carbon_course.svg',
                fit: BoxFit.scaleDown,
                height: 32.w,
                width: 32.w,
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${course.courseTitle}',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: Styles.font,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff202325)),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      '${course.courseCode}',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: Styles.font,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff202325)),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Unit: ${course.unit}',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: Styles.font,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff202325)),
                    )
                  ],
                ),
              ),
              SvgPicture.asset(
                'assets/images/forward_arrow.svg',
                fit: BoxFit.scaleDown,
                height: 24.w,
                width: 24.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
