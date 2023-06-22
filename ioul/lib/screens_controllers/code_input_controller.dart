import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../screen_views/code_input_view.dart';

class CodeInput extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const CodeInput({Key? key}) : super(key: key);

  @override
  CodeInputController createState() => CodeInputController();
}

class CodeInputController extends State<CodeInput> {
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
  Widget build(BuildContext context) => CodeInputView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
