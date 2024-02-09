import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/packages/package.dart';
import 'package:ioul/values/values.dart';

class ElevatedButtonWidget extends StatelessWidget {
  const ElevatedButtonWidget({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap(),
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48.r),
        ),
        backgroundColor:
            title == "Back" ? AppColors.backgroundWhite : AppColors.primary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title == "Back"
              ? SvgPicture.asset(
                  'assets/images/back.svg',
                  color: AppColors.primary,
                )
              : const SizedBox.shrink(),
          title == "Next"
              ? SizedBox(
                  width: 0.w,
                )
              : SizedBox(
                  width: 5.w,
                ),
          Text(
            title,
            style: title == "Back"
                ? Styles.x16dp_25435B_500w()
                : Styles.x16dp_0FFFFFF_500w(),
          ),
          title == "Back"
              ? SizedBox(
                  width: 0.w,
                )
              : SizedBox(
                  width: 5.w,
                ),
          title == "Next"
              ? SvgPicture.asset('assets/images/forward_arrow.svg',
                  color: Colors.white)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
