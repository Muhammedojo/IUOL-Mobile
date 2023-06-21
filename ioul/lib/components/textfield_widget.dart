import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/values/values.dart';

import '../values/styles.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    Key? key,
    required this.title,
    this.passwordIcon,
    this.obscureText,
    required this.controller,
  }) : super(key: key);
  final String title;
  final Widget? passwordIcon;
  final TextEditingController controller;
  final bool? obscureText;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.x16dp_72777A_400w(),
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        
        isCollapsed: true,
        contentPadding: REdgeInsets.all(16),
        filled: true,
        suffixIcon: passwordIcon,
        labelText: title,
        labelStyle: Styles.x12dp_72777A_400w(),
        fillColor: AppColors.backgroundWhite,

        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.inkLight),
          borderRadius: BorderRadius.circular(8.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.inkLighter),
          borderRadius: BorderRadius.circular(8.r),
        ),
        // enabledBorder: OutlineInputBorder(
        //   borderSide: BorderSide.none,
        // ),
      ),
    );
  }
}
