import 'package:flutter/material.dart';
import '../packages/package.dart';

class ResourcesWidget extends StatelessWidget {
  final String? type;
  final String? number;
  final Color? color;
  final String? image;
  final Function()? onTap;

  const ResourcesWidget({
    Key? key,
    required this.type,
    required this.number,
    required this.color,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Padding(
          padding: REdgeInsets.only(top: 16.0, bottom: 16.0, right: 30, left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                '$image',
                fit: BoxFit.scaleDown,
                height: 44.h,
                width: 31.w,
              ),
              SizedBox(
                height: 20.w,
              ),
              Text(
                '$number',
                style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff000000)),
              ),
              SizedBox(
                height: 3.w,
              ),
              Text('$type',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff000000))),
            ],
          ),
        ),
      ),
    );
  }
}
