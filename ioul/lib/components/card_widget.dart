import 'package:flutter/material.dart';
import 'package:ioul/values/colors.dart';
import '../packages/package.dart';

class CardWidget extends StatelessWidget {
  final String? title;
  final String? number;
  final Function()? onTap;

  const CardWidget({
    Key? key,
    required this.title,
    required this.number,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          // height: 110.h,
          // width: 165.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.lightBlue,
          ),
          child: Padding(
            padding: REdgeInsets.symmetric(vertical: 24.0,horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.secondaryLightBlue,
                  ),
                  child: Padding(
                    padding:REdgeInsets.all(8.0),
                    child: Text('$number',style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                      color: const Color(0xff25435B),
                    ),),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    Text(
                      '$title',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
              ],
            ),
          ),
        ));
  }
}
