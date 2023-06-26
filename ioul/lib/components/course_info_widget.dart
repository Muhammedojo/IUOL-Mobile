import 'package:flutter/material.dart';
import '../packages/package.dart';

class CourseInfoWidget extends StatelessWidget {
  final Function()? onTap;
  const CourseInfoWidget({Key? key, required this.onTap}) : super(key: key);

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
          padding: REdgeInsets.symmetric(vertical: 24.0, horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ARB 111 - Introduction to Arabic Language',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w800,
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
                          Text(
                            '1st Semester',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff000000)),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/grommet.svg',
                            height: 24.w,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                          ),
                          Text(
                            '4 Resources',
                            style: TextStyle(
                                fontSize: 15.sp,
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
                            '2 Assignments',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff000000)),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/report.svg',
                            height: 24.w,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                          ),
                          Text(
                            '2 Reports',
                            style: TextStyle(
                                fontSize: 15.sp,
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
