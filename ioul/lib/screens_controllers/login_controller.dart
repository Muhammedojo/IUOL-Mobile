import '../helpers/helper.dart';
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
  Widget build(BuildContext context) => LoginView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
