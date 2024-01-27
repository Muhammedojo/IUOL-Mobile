import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../provider/provider.dart';
import '../router/router.dart';
import '../screen_views/reset_password.dart';

class ResetPassword extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ResetPassword({Key? key, required this.pin, required this.email})
      : super(key: key);
  final String pin;
  final String email;

  @override
  ResetPasswordController createState() => ResetPasswordController();
}

class ResetPasswordController extends State<ResetPassword> {
  //... //Initialization code, state vars etc, all go here
  final repository = AppRepository();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  toggleVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  toggleConfirmVisibility() {
    setState(() {
      confirmPasswordVisible = !confirmPasswordVisible;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ResetPasswordView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  resetPassword() async {
    var password = passwordController.text.trim();
    var confirmPassword = confirmPasswordController.text.trim();

    if (password.isEmpty) {
      WidgetHelper.showToastError(context, "Password is required");
      return;
    } else if (!isStrongPassword(password)) {
      WidgetHelper.showToastError(context,
          "Weak password. Use at least 8 characters with a mix of uppercase, lowercase, and numbers.");
      return;
    }

    if (confirmPassword != password) {
      WidgetHelper.showToastError(context, "Password does not match");
      return;
    }
    resetMayPassword(password, confirmPassword);
  }

  resetMayPassword(String password, String confirmPassword) async {
    var pin = widget.pin;
    var email = widget.email;
    try {
      WidgetHelper.showProgress(text: 'Checking');
      var loginResponse =
          await repository.newPassword(password, confirmPassword, email, pin);
      WidgetHelper.hideProgress();
      if (!mounted) return;
      if (loginResponse.isConnectionSuccessful()) {
        NavigatorHelper(context).pushNamedScreen(RouteConstants.login);
      } else {
        WidgetHelper.showToastError(context, ('${loginResponse.message}'));
        return;
      }
    } catch (e) {
      WidgetHelper.hideProgress();
    }
  }

  bool isStrongPassword(String password) {
    // Regular expression for a strong password (at least 8 characters with a mix of uppercase, lowercase, and numbers)
    final passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return passwordRegex.hasMatch(password);
  }
}
