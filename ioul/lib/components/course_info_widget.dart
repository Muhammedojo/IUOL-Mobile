import 'package:ioul/values/values.dart';

import '../model/model.dart';
import '../packages/package.dart';

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
          padding: REdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 15.w,
              ),
              const Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 15.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/clock.svg',
                            height: 24.w,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '${course?.courseSummary?.semesterName} Semester',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: Styles.font,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff000000)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/grommet.svg',
                            height: 24.w,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            '${course?.courseSummary?.resourcesCount} Resources',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: Styles.font,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff000000)),
                          )
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/assignment.svg',
                            height: 24.w,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                          ),
                          Text(
                            '${course?.courseSummary?.assignmentCount} Assignment',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: Styles.font,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff000000)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/report.svg',
                            height: 24.w,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                          ),
                          Text(
                            '${course?.courseSummary?.reportCount} Report',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: Styles.font,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff000000)),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
