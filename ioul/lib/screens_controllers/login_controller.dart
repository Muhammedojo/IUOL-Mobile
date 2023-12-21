import 'package:ioul/provider/provider.dart';
import '../helpers/helper.dart';
import '../router/router.dart';
import '../screen_views/Login_view.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';

class Login extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Login({Key? key}) : super(key: key);

  @override
  LoginController createState() => LoginController();
}

class LoginController extends State<Login> {
  //... //Initialization code, state vars etc, all go here

  final repository = AppRepository();
  bool visible = false;
  String deviceToken = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  toggleVisibility() {
    setState(() {
      visible = !visible;
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
  Widget build(BuildContext context) => LoginView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  bool isValidEmail(String email) {
    // Regular expression for a valid email address
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  bool isStrongPassword(String password) {
    // Regular expression for a strong password (at least 8 characters with a mix of uppercase, lowercase, and numbers)
    final passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  void onPressLoginButton() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty) {
      WidgetHelper.showToastError(context, "Email is required");
      return;
    } else if (!isValidEmail(email)) {
      WidgetHelper.showToastError(context, "Invalid email address");
      return;
    }

    if (password.isEmpty) {
      WidgetHelper.showToastError(context, "Password is required");
      return;
    } else if (!isStrongPassword(password)) {
      WidgetHelper.showToastError(context,
          "Weak password. Use at least 8 characters with a mix of uppercase, lowercase, and numbers.");
      return;
    }
    loginUser(email, password);
  }

  void loginUser(String username, String password) async {
    try {
      WidgetHelper.showProgress(text: 'Checking');
      var loginResponse =
          await repository.login(username, password, deviceToken);
      WidgetHelper.hideProgress();
      if (loginResponse.isRequestSuccessful()) {
        NavigatorHelper(context)
            .pushNamedScreen(RouteConstants.admissionPayment);
      } else {
        WidgetHelper.showToastError(context, ('${loginResponse.message}'));
        return;
      }
    } catch (e) {
      WidgetHelper.hideProgress();
    }
  }
}
