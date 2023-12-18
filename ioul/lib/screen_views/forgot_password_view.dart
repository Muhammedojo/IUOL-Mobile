import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/helpers/helper.dart';
import 'package:ioul/router/route_constants.dart';
import '../components/components.dart';
import '../screens_controllers/forgot_password_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class ForgotPasswordView
    extends StatelessView<ForgotPassword, ForgotPasswordController> {
  const ForgotPasswordView(ForgotPasswordController state, {Key? key})
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
                    text: "Forgotten your password?",
                    style: Styles.x24dp_090A0A_700w(),
                  ),
                  SizedBox(height: 8.h),
                  TextWidget(
                    text:
                        "Don't worry, we'll send you a message to help you reset your password.",
                    style: Styles.x16dp_090A0A_400w(),
                  ),
                  SizedBox(height: 26.h),
                  TextFieldWidget(
                    title: "Email",
                    controller: state.emailController,
                  ),
                  SizedBox(height: 259.h),
                  ElevatedButtonWidget(
                    title: "Continue",
                    onTap: () => NavigatorHelper(context)
                        .pushNamedScreen(RouteConstants.codeInput),
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
