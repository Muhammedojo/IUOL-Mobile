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
import '../screens_controllers/create_account.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class CreateAccountView
    extends StatelessView<CreateAccount, CreateAccountController> {
  const CreateAccountView(CreateAccountController state, {Key? key})
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
              child: state.nextForms == false
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: 12.h),
                        TextWidget(
                          text: "Create an account",
                          style: Styles.x24dp_090A0A_700w(),
                        ),
                        // SizedBox(height: 8.h),
                        // TextWidget(
                        //   text: "Log in to your account",
                        //   style: Styles.x16dp_090A0A_400w(),
                        // ),
                        SizedBox(height: 26.h),
                        TextfieldWidget(
                          title: "First name",
                          controller: state.firstNameController,
                        ),
                        SizedBox(height: 20.h),
                        TextfieldWidget(
                          title: "Surname",
                          controller: state.surnameController,
                        ),
                        SizedBox(height: 20.h),
                        TextfieldWidget(
                          title: "Surname",
                          controller: state.middlenameController,
                        ),
                        SizedBox(height: 108.h),
                        ElevatedButtonWidget(
                          title: "Continue",
                          onTap: () => state.toggleNextForms(),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: Styles.x12dp_090A0A_400w(),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => NavigatorHelper(context)
                                            .pushNamedScreen(
                                          RouteConstants.login,
                                        ),
                                  text: "Sign in ",
                                  style: Styles.x12dp_4EAFFF_400w(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height: 12.h),
                        TextWidget(
                          text: "Create an account",
                          style: Styles.x24dp_090A0A_700w(),
                        ),
                        // SizedBox(height: 8.h),
                        // TextWidget(
                        //   text: "Log in to your account",
                        //   style: Styles.x16dp_090A0A_400w(),
                        // ),
                        SizedBox(height: 26.h),
                        TextfieldWidget(
                          title: "Email address",
                          controller: state.emailController,
                        ),
                        SizedBox(height: 20.h),
                        TextfieldWidget(
                          title: "Confirm email address",
                          controller: state.emailConfirmController,
                        ),
                        SizedBox(height: 20.h),
                        TextfieldWidget(
                          title: "Phone number",
                          controller: state.phoneController,
                        ),
                        SizedBox(height: 20.h),
                        TextfieldWidget(
                          title: "Password",
                          controller: state.passwordController,
                        ),
                        SizedBox(height: 20.h),
                        TextfieldWidget(
                          title: "Confirm password",
                          controller: state.passwordConfirmController,
                        ),
                        SizedBox(height: 176.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              activeColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              value: state.checked,
                              onChanged: (e) => state.toggleCheck(),
                            ),
                            SizedBox(width: 8.w),
                            RichText(
                              text: TextSpan(
                                text: "I agree with the ",
                                style: Styles.x12dp_090A0A_400w(),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => NavigatorHelper(context)
                                              .pushNamedScreen(
                                            RouteConstants.login,
                                          ),
                                    text: "Terms and Conditions ",
                                    style: Styles.x12dp_4EAFFF_400w(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        ElevatedButtonWidget(
                          title: "Submit",
                          onTap: () => NavigatorHelper(context)
                              .goNamedScreen(RouteConstants.courses),
                        ),
                        SizedBox(height: 20.h),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: "Already have an account? ",
                              style: Styles.x12dp_090A0A_400w(),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => NavigatorHelper(context)
                                            .pushNamedScreen(
                                          RouteConstants.login,
                                        ),
                                  text: "Sign in ",
                                  style: Styles.x12dp_4EAFFF_400w(),
                                ),
                              ],
                            ),
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
