import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/components/elevated_button_widget.dart';
import 'package:ioul/components/text_widget.dart';
import 'package:ioul/components/textfield_widget.dart';
import 'package:ioul/helpers/helper.dart';
import 'package:ioul/helpers/widget_helper.dart';
import 'package:ioul/router/route_constants.dart';
import 'package:ioul/values/styles.dart';
import '../components/components.dart';
import '../screens_controllers/reset_password.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class ResetPasswordView
    extends StatelessView<ResetPassword, ResetPasswordController> {
  const ResetPasswordView(ResetPasswordController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundWhite,
      appBar: WidgetHelper().appBackArrowOnly(context),
      body: WidgetWrapper(
        child: SingleChildScrollView(
          child: SizedBox(
            // padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 12.h),
                  TextWidget(
                    text: "Reset your password",
                    style: Styles.x24dp_090A0A_700w(),
                  ),
                  SizedBox(height: 8.h),
                  TextWidget(
                    text: "Please set a new password for your account.",
                    style: Styles.x16dp_090A0A_400w(),
                  ),
                  SizedBox(height: 26.h),
                  TextfieldWidget(
                    title: "New Password",
                    controller: state.passwordController,
                    obscureText: state.passwordVisible,
                    passwordIcon: InkWell(
                      onTap: () => state.toggleVisibility(),
                      child: Icon(
                        state.passwordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 22.w.h,
                        color: AppColors.inkDarkest,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextfieldWidget(
                    title: "Confirm New Password",
                    controller: state.confirmPasswordController,
                    obscureText: state.confirmPasswordVisible,
                    passwordIcon: InkWell(
                      onTap: () => state.toggleConfirmVisibility(),
                      child: Icon(
                        state.confirmPasswordVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 22.w.h,
                        color: AppColors.inkDarkest,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  InkWell(
                    onTap: () => NavigatorHelper(context).pushNamedScreen(
                      RouteConstants.forgotPassword,
                    ),
                    child: TextWidget(
                      text: "Return to log in",
                      style: Styles.x16dp_4EAFFF_500w(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 167.h),
                  ElevatedButtonWidget(
                    title: "Log in",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
