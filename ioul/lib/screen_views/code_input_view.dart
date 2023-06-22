import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/components/elevated_button_widget.dart';
import 'package:ioul/components/text_widget.dart';
import 'package:ioul/components/textfield_widget.dart';
import 'package:ioul/helpers/helper.dart';
import 'package:ioul/helpers/widget_helper.dart';
import 'package:ioul/router/route_constants.dart';
import 'package:ioul/values/styles.dart';
import 'package:pinput/pinput.dart';
import '../components/components.dart';
import '../screens_controllers/code_input_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class CodeInputView extends StatelessView<CodeInput, CodeInputController> {
  const CodeInputView(CodeInputController state, {Key? key})
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
                    text: "Let us know it's you",
                    style: Styles.x24dp_090A0A_700w(),
                  ),
                  SizedBox(height: 8.h),
                  TextWidget(
                    text:
                        "Last step! To secure your account, enter the code we just sent to spythonian@gmail.com.",
                    style: Styles.x16dp_090A0A_400w(),
                  ),
                  SizedBox(height: 40.h),
                  Align(
                    alignment: Alignment.center,
                    child: Pinput(
                      defaultPinTheme: PinTheme(
                        textStyle: Styles.x36dp_25435B_500w(),
                        width: 61.w,
                        height: 75.h,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundWhite,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: AppColors.lightGrey,
                            width: 2.w,
                          ),
                        ),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 61.w,
                        height: 75.h,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundWhite,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: AppColors.primaryBase,
                            width: 2.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 27.h),
                  RichText(
                    text: TextSpan(
                      text: "Didn't get the code? ",
                      style: Styles.x12dp_090A0A_400w(),
                      children: [
                        TextSpan(
                          text: "Resend code ",
                          style: Styles.x12dp_4EAFFF_400w(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 147.h),
                  ElevatedButtonWidget(
                    title: "Continue",
                    onTap: () => NavigatorHelper(context).pushNamedScreen(
                      RouteConstants.resetPassword,
                    ),
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
