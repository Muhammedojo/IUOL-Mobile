import '../core/core.dart';

class CourseInfoWidget extends StatelessWidget {
  final Function()? onTap;
  final Course? course;
  const CourseInfoWidget({Key? key, required this.onTap, required this.course})
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
          padding: REdgeInsets.symmetric(vertical: 15.0, horizontal: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${course?.courseTitle}',
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontFamily: Styles.font,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff000000)),
                  )
                ],
              ),
              SizedBox(
                height: 10.w,
              ),
              const Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 10.w,
              ),
              Row(
                children: [
                  'clock'.toSvg(height: 23.w, width: 23.w),
                  SizedBox(
                    width: 4.w,
                  ),
                  '${course?.courseSummary?.semesterName} Semester'
                      .toText(color: AppColors.inkDarker),
                  const Spacer(),
                  'assignment'.toSvg(height: 23.w, width: 23.w),
                  SizedBox(
                    width: 4.w,
                  ),
                  '${course?.courseSummary?.assignmentCount} Assignment'
                      .toText(color: AppColors.inkDarker)
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  'grommet'.toSvg(height: 23.w, width: 23.w),
                  SizedBox(
                    width: 4.w,
                  ),
                  '${course?.courseSummary?.resourcesCount} Resources'
                      .toText(color: AppColors.inkDarker),
                  const Spacer(),
                  'report'.toSvg(height: 23.w, width: 23.w),
                  SizedBox(
                    width: 4.w,
                  ),
                  '${course?.courseSummary?.reportCount} Report'
                      .toText(color: AppColors.inkDarker),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
