import 'package:flutter/material.dart';
import '../packages/package.dart';

class DocumentResourcesWidget extends StatelessWidget {
  final String? image;
  final Function()? onTap;

  const DocumentResourcesWidget({
    Key? key,
    required this.image,
    required this.onTap
  }) : super(key: key);

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
          padding: REdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                '$image',
                fit: BoxFit.scaleDown,
                height: 60.w,
                width: 60.w,
              ),
              SizedBox(
                width: 14.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Module One Test 1 (Part 1) ',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff202325)),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Introduction to Arabic Language',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff202325)),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                'assets/images/cloud.svg',
                fit: BoxFit.scaleDown,
                height: 30.w,
                width: 30.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
