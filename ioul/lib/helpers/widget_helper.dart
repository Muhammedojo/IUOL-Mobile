import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/components/text_widget.dart';
import 'package:ioul/helpers/helper.dart';
import 'package:ioul/values/styles.dart';

import '../values/colors.dart';

class WidgetHelper {
  AppBar appBackArrowOnly(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      leadingWidth: 45.w,
      leading: InkWell(
        onTap: () => NavigatorHelper(context).closeScreen(),
        child: Row(
          children: [
            SizedBox(width: 24.w),
            Icon(
              Icons.arrow_back_ios,
              size: 16.w.h,
              color: AppColors.inkDarkest,
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBackArrowWithTitle(BuildContext context, {required String title}) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      leadingWidth: 45.w,
      title: TextWidget(
        text: title,
        style: Styles.x18dp_202325_500w(),
      ),
      // centerTitle: false,
      leading: InkWell(
        onTap: () => NavigatorHelper(context).closeScreen(),
        child: Row(
          children: [
            SizedBox(width: 24.w),
            Icon(
              Icons.arrow_back_ios,
              size: 16.w,
              color: AppColors.inkDarkest,
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBackArrowWithTitleAndTabBar(BuildContext context,
      {required String title, required Widget bottomWidget}) {
    return AppBar(
      backgroundColor: const Color(0xff25435B),
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      leadingWidth: 45.w,
      title: TextWidget(
        text: title,
        style: Styles.x18dp_202325_500g(),
      ),
      // centerTitle: false,
      leading: InkWell(
        onTap: () => NavigatorHelper(context).closeScreen(),
        child: Row(
          children: [
            SizedBox(width: 24.w),
            Icon(
              Icons.arrow_back_ios,
              size: 16.w.h,
              color: AppColors.inkDarkest,
            ),
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, 65.h),
        child: bottomWidget,
      ),
    );
  }
}
