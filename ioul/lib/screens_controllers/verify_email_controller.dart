import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../screen_views/verify_email_view.dart';

class VerifyEmail extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const VerifyEmail({Key? key}) : super(key: key);

  @override
  VerifyEmailController createState() => VerifyEmailController();
}

class VerifyEmailController extends State<VerifyEmail> {
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
  Widget build(BuildContext context) => VerifyEmailView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
