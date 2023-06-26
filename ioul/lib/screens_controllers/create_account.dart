import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../screen_views/create_account.dart';

class CreateAccount extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const CreateAccount({Key? key}) : super(key: key);

  @override
  CreateAccountController createState() => CreateAccountController();
}

class CreateAccountController extends State<CreateAccount> {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController middlenameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  bool nextForms = false;
  bool checked = false;

  toggleVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  toggleCheck() {
    setState(() {
      checked = !checked;
    });
  }

  toggleNextForms() {
    setState(() {
      nextForms = true;
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
  Widget build(BuildContext context) => CreateAccountView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
