import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../screen_views/reset_password.dart';

class ResetPassword extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ResetPassword({Key? key}) : super(key: key);

  @override
  ResetPasswordController createState() => ResetPasswordController();
}

class ResetPasswordController extends State<ResetPassword> {
  //... //Initialization code, state vars etc, all go here

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
}
