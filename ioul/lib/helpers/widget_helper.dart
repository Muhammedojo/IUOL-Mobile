import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/helpers/helper.dart';
import 'package:ioul/values/styles.dart';

import '../components/components.dart';
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

  static showSuccessToast(BuildContext context, String message,
      {Function()? onTap}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => ResponseConfirmationWidget(
            title: "success", message: message, image: "", onTap: () => onTap));
  }

  static showToastError(BuildContext context, String message,
      {String? actionLabel, Function? onActionPressed}) {
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.primary,
      content: Text(
        message,
        style: Styles.x14dp_090A0A_400w(),
      ),
      action: onActionPressed != null
          ? SnackBarAction(
              label: actionLabel ?? "Close",
              textColor:
                  AppColors.backgroundWhite, // or some operation you would like
              onPressed: () {
                onActionPressed();
                // on block runs when label is pressed
              },
            )
          : null,
    ));
  }

  static showProgress({String? text}) {
    if (text != null && text.isNotEmpty) {
      return EasyLoading.show(
        status: text,
        maskType: EasyLoadingMaskType.black,

        // indicator: const CircularProgressIndicator(
        //   strokeWidth: 2.0,
        //   color: Colors.white,
        // )
      );
    }
    return EasyLoading.show(
        indicator: const CircularProgressIndicator(
      strokeWidth: 2.0,
      color: Colors.white,
    ));
  }

  static hideProgress() {
    return EasyLoading.dismiss();
  }

  AppBar appBackArrowWithTitleAndTabBar(BuildContext context,
      {required String title, required Widget bottomWidget}) {
    return AppBar(
      backgroundColor: Colors.white,

      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      leadingWidth: 45.w,
      title: TextWidget(
        text: title,
        style: Styles.x18dp_202325_500g(color: AppColors.inkDarkest),
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
