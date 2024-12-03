import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../../courses/presentation/controller/controller.dart';
import '../../../more/presentation/controller/controller.dart';
import '../bloc/bloc.dart';
import '../controller/controller.dart';

class LoginView extends StatelessView<LoginScreen, LoginController> {
  const LoginView(LoginController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundWhite,
      body: SafeArea(
        child: WidgetWrapper(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 48.h),
                    TextWidget(
                      text: "Welcome back",
                      style: Styles.x24dp_090A0A_700w(),
                    ),
                    SizedBox(height: 8.h),
                    TextWidget(
                      text: "Log in to your account",
                      style: Styles.x16dp_090A0A_400w(),
                    ),
                    SizedBox(height: 26.h),
                    TextFieldWidget(
                      title: "email".tr(),
                      controller: state.emailController,
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 60.h,
                      child: TextFieldWidget(
                        title: "password".tr(),
                        controller: state.passwordController,
                        obscureText: state.visible,
                        onValidate: ValidationBuilder().required().build(),
                        isDense: false,
                        isCollapsed: false,
                        padding:
                            REdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        passwordIcon: InkWell(
                          radius: 0,
                          onTap: () => state.toggleVisibility(),
                          child: Icon(
                            state.visible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 22.sp,
                            color: AppColors.inkDarkest,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    InkWell(
                      onTap: () => NavigatorHelper(context).pushNamedScreen(
                        RouteConstants.forgotPassword,
                      ),
                      child: TextWidget(
                        text: "forgot_password".tr(),
                        style: Styles.x16dp_4EAFFF_500w(),
                      ),
                    ),
                    SizedBox(height: 147.h),
                    RichText(
                      text: TextSpan(
                        text: "By continuing, you agree to our ",
                        style: Styles.x12dp_090A0A_400w(),
                        children: [
                          TextSpan(
                              text: "Terms of Service ",
                              style: Styles.x12dp_4EAFFF_400w(),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TermsAndServices()),
                                  );
                                }),
                          TextSpan(
                            text: "& ",
                            style: Styles.x12dp_090A0A_400w(),
                          ),
                          TextSpan(
                              text: "Privacy Policy",
                              style: Styles.x12dp_4EAFFF_400w(),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PrivacyPolicy()),
                                  );
                                }),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    BlocListener<LoginCubit, LoginState>(
                      listener: (context, loginState) {
                        if (loginState is LoginLoading) {
                          WidgetHelper.showProgress(text: "checking".tr());
                        } else if (loginState is LoginLoaded) {
                          WidgetHelper.hideProgress();

                          loginState.loginResponse.user!.hasApplication == false
                              ?
                              //context.goNamed(RouteConstants.admissionPayment)
                              context.goNamed(RouteConstants.dashboard,
                                  extra: loginState.loginResponse.user)
                              : (loginState.loginResponse.user!.isAdmitted ==
                                      false
                                  ? context.goNamed(
                                      RouteConstants.pendingApplication)
                                  : context.goNamed(RouteConstants.dashboard,
                                      extra: loginState.loginResponse.user));
                        } else if (loginState is LoginFailure) {
                          WidgetHelper.hideProgress();
                          WidgetHelper.showToastError(
                              context, loginState.message.toString());

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CourseDetailOverview()),
                          );
                        }
                      },
                      child: ElevatedButtonWidget(
                        title: "login".tr(),
                        onTap: () => state.onPressLoginButton(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: Styles.x12dp_090A0A_400w(),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    NavigatorHelper(context).pushNamedScreen(
                                      RouteConstants.createAccount,
                                    ),
                              text: "Sign up ",
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
      ),
    );
  }
}
