import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/values/values.dart';


class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.title,
    this.passwordIcon,
    this.obscureText,
    this.hint,
    this.readOnly,
    required this.controller,
  }) : super(key: key);
  final String? title;
  final bool? readOnly;
  final Widget? passwordIcon;
  final TextEditingController controller;
  final bool? obscureText;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Styles.x16dp_72777A_400w(),
      controller: controller,
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        isCollapsed: true,
        isDense: true,
        contentPadding: REdgeInsets.all(16),
        fillColor: AppColors.backgroundWhite,
        filled: true,
        suffixIcon: passwordIcon,
        labelText: title,
        hintText: hint,
        hintStyle: Styles.x12dp_72777A_400w(),
        labelStyle: Styles.x12dp_72777A_400w(),

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
