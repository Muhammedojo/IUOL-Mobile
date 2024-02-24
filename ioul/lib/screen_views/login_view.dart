import 'package:ioul/screens/screens.dart';

import '../packages/package.dart';
import 'package:ioul/helpers/helper.dart';
import '../router/router.dart';
import '../components/components.dart';
import '../screens_controllers/login_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class LoginView extends StatelessView<Login, LoginController> {
  const LoginView(LoginController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundWhite,
      // appBar: WidgetHelper().appBackArrowOnly(context),
      body: SafeArea(
        child: WidgetWrapper(
          child: SingleChildScrollView(
            child: SizedBox(
              // padding: MediaQuery.of(context).viewInsets,
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
                      title: "Email",
                      controller: state.emailController,
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 60.h,
                      child: TextFieldWidget(
                        title: "Password",
                        controller: state.passwordController,
                        obscureText: state.visible,
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
                            size: 22.w.h,
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
                        text: "Forgot Password?",
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
                    ElevatedButtonWidget(
                      title: "Log in",
                      onTap: () =>
                          // Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const Dashboard()),
                          //     )

                          state.onPressLoginButton(),
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
