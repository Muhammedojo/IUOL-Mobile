import '../packages/package.dart';

class EnrolledCourseWidget extends StatelessWidget {
  final Function()? onTap;
  const EnrolledCourseWidget({Key? key, required this.onTap}) : super(key: key);

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
                      'Introduction to Arabic Language',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff202325)),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'ARB 111',
                      style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff202325)),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Unit: 4',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: 'Inter',
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
