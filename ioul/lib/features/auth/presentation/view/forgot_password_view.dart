import '../../../../components/components.dart';
import '../controller/forgot_password_controller.dart';
import '../../../../core/utils/mvc.dart';
import '../../../../core/core.dart';

class ForgotPasswordView
    extends StatelessView<ForgotPasswordScreen, ForgotPasswordController> {
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
                    text: "forgotten_password".tr(),
                    style: Styles.x24dp_090A0A_700w(),
                  ),
                  SizedBox(height: 8.h),
                  TextWidget(
                    text: "message_to_reset_password".tr(),
                    style: Styles.x16dp_090A0A_400w(),
                  ),
                  SizedBox(height: 26.h),
                  TextFieldWidget(
                    title: "email".tr(),
                    controller: state.emailController,
                  ),
                  SizedBox(height: 259.h),
                  ElevatedButtonWidget(
                      title: "continue".tr(),
                      onTap: () => state.onTapPasswordResetButton()
                      //NavigatorHelper(context)
                      //  .pushNamedScreen(RouteConstants.codeInput),
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
