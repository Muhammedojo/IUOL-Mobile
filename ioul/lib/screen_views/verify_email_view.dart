import 'package:flutter/gestures.dart';
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
import '../screens_controllers/verify_email_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class VerifyEmailView
    extends StatelessView<VerifyEmail, VerifyEmailController> {
  const VerifyEmailView(VerifyEmailController state, {Key? key})
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  TextWidget(
                    text: "Verify email address",
                    style: Styles.x24dp_090A0A_700w(),
                  ),
                  SizedBox(height: 171.h),
                  TextWidget(
                    text:
                        "Check your email inbox, we have sent you a verification link to your email. You can also check your spam box",
                    style: Styles.x16dp_090A0A_400w(),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
