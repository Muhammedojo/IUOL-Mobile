import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        backgroundColor: AppColors.primary,
      ),
      child: Text(
        title,
        style: Styles.x16dp_0FFFFFF_500w(),
      ),
    );
  }
}
