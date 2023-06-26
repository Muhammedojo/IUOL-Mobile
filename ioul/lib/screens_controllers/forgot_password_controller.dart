import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../screen_views/forgot_password_view.dart';

class ForgotPassword extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  ForgotPasswordController createState() => ForgotPasswordController();
}

class ForgotPasswordController extends State<ForgotPassword> {
  //... //Initialization code, state vars etc, all go here

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
}
