import 'package:flutter/cupertino.dart';
import 'package:ioul/screens_controllers/code_input_controller.dart';
import '../helpers/helper.dart';
import '../provider/provider.dart';
import '../router/router.dart';
import '../screen_views/forgot_password_view.dart';

class ForgotPassword extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  ForgotPasswordController createState() => ForgotPasswordController();
}

class ForgotPasswordController extends State<ForgotPassword> {
  //... //Initialization code, state vars etc, all go here

  final repository = AppRepository();
  bool visible = false;
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
  Widget build(BuildContext context) => ForgotPasswordView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  bool isValidEmail(String email) {
    // Regular expression for a valid email address
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  void onTapPasswordResetButton() {
    FocusManager.instance.primaryFocus?.unfocus();
    var email = emailController.text.trim();

    if (email.isEmpty) {
      WidgetHelper.showToastError(context, "Kindly provide your email.");
      return;
    } else if (!isValidEmail(email)) {
      WidgetHelper.showToastError(context, "Invalid email address.");
      return;
    }
    requestPasswordReset(email);
  }

  void requestPasswordReset(String email) async {
    try {
      WidgetHelper.showProgress(text: 'Processing');
      var response = await repository.forgotPassword(email);
      WidgetHelper.hideProgress();
      if (response.isConnectionSuccessful()) {
        // ignore: use_build_context_synchronously
        // NavigatorHelper(context).pushNamedScreen(RouteConstants.codeInput);

        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => CodeInput(
              email: emailController.text.trim(),
            ),
          ),
        );

        // ignore: use_build_context_synchronously
      } else {
        // ignore: use_build_context_synchronously
        WidgetHelper.showToastError(context, ('${response.message}'));
        return;
      }
    } catch (e) {
      WidgetHelper.hideProgress();
    }
  }
}
