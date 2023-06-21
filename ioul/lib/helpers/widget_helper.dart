import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

class WidgetHelper{
  AppBar appBackArrowOnly(){
    return AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        leading: Row(
          children: [
            SizedBox(width: 24.w),
            Icon(
              Icons.arrow_back_ios,
              size: 16.w.h,
              color: AppColors.inkDarkest,
            ),
          ],
        ),
      );
  }
}