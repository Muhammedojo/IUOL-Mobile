import 'package:ioul/helpers/helper.dart';
import 'package:pinput/pinput.dart';
import '../bloc/bloc.dart';
import '../bloc/resend_email_verification/cubit.dart';
import '../components/components.dart';
import '../packages/package.dart';
import '../router/router.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 12.h),
                  TextWidget(
                    text: "Let us know it's you",
                    style: Styles.x24dp_090A0A_700w(),
                  ),
                  SizedBox(height: 8.h),
                  RichText(
                    text: TextSpan(
                      text:
                          "Last step! To secure your account, enter the code we just sent to ",
                      style: Styles.x16dp_090A0A_400w(),
                      children: [
                        TextSpan(
                          text: "${widget.email}.",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                state.resendEmailVerification(widget.email),
                          style: Styles.x16dp_090A0A_400w(
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Align(
                    alignment: Alignment.center,
                    child: Pinput(
                      controller: state.pinputController,
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
                  BlocListener<ResendEmailVerificationCubit,
                      ResendEmailVerificationState>(
                    listener: (context, state) {
                      if (state is ResendEmailVerificationLoading) {
                        WidgetHelper.showProgress(text: "Processing");
                      }
                      if (state is ResendEmailVerificationLoaded) {
                        WidgetHelper.hideProgress();
                        WidgetHelper.showToastError(context,
                            "${state.resendEmailVerificationResponse.message}");
                      }
                      if (state is ResendEmailVerificationFailure) {
                        WidgetHelper.hideProgress();
                        WidgetHelper.showToastError(context, state.message);
                      }
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Didn't get the code? ",
                        style: Styles.x16dp_090A0A_400w(),
                        children: [
                          TextSpan(
                            text: "Resend code ",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () =>
                                  state.resendEmailVerification(widget.email),
                            style: Styles.x16dp_4EAFFFF_400w(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 147.h),
                  BlocListener<VerifyEmailCubit, VerifyEmailState>(
                    listener: (context, verifyState) {
                      if (verifyState is VerifyEmailLoading) {
                        WidgetHelper.showProgress(text: "Processing");
                      } else if (verifyState is VerifyEmailLoaded) {
                        WidgetHelper.hideProgress();
                        WidgetHelper.showSuccessToast(
                            context, 'Registration Successful');
                        context.goNamed(RouteConstants.admissionPayment);
                      } else if (verifyState is VerifyEmailFailure) {
                        WidgetHelper.hideProgress();
                        WidgetHelper.showSuccessToast(
                            context, verifyState.message);
                      }
                    },
                    child: ElevatedButtonWidget(
                        title: "Continue",
                        onTap: () {
                          state.verifyPin();
                        }),
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
