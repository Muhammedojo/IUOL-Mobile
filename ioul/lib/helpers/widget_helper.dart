import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/helpers/helper.dart';

import '../values/colors.dart';

class WidgetHelper {
  AppBar appBackArrowOnly(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
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
}
