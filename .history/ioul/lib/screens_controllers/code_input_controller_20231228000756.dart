import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:ioul/bloc/verify_email.com/verify_email_cubit.dart';
import 'package:ioul/model/model.dart';
import 'package:ioul/screens_controllers/reset_password.dart';

import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../provider/provider.dart';
import '../router/router.dart';
import '../screen_views/code_input_view.dart';

class CodeInput extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const CodeInput({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  CodeInputController createState() => CodeInputController();
}

class CodeInputController extends State<CodeInput> {
  //... //Initialization code, state vars etc, all go here
  final repository = AppRepository();
  TextEditingController pinputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    log("state email: ${widget.email}");
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

  verifyPin() async {
    var pin = pinputController.text.trim();
    var email = widget.email;

    if (pin.isEmpty) {
      WidgetHelper.showToastError(context, "Kindly provide your pin.");
      return;
    } else if (pin.length < 4) {
      WidgetHelper.showToastError(context, "Incomplete pin.");
      return;
    }
    sendPinToServer(pin, email);
  }

  void sendPinToServer(String pin, String email) async {
    // final VerifyEmail data = VerifyEmail();
    // data.email = widget.email;
    // data.pin = pinputController.text;
    // context.read<VerifyEmailCubit>().pushPinToServer(data);
      var response = await repository.resetPassword(pin, email);
    // try {
    //   WidgetHelper.showProgress(text: 'Processing');
    //   var response = await repository.resetPassword(pin, email);
    //   WidgetHelper.hideProgress();
    //   if (response.isConnectionSuccessful()) {
    //     // ignore: use_build_context_synchronously
    //     //  NavigatorHelper(context).pushNamedScreen(RouteConstants.resetPassword);

    //     Navigator.push(
    //       context,
    //       CupertinoPageRoute(
    //         builder: (context) => ResetPassword(
    //           email: widget.email,
    //           pin: pinputController.text,
    //         ),
    //       ),
    //     );
    //   } else {
    //     // ignore: use_build_context_synchronously
    //     WidgetHelper.showToastError(context, ('${response.message}'));
    //     return;
    //   }
    // } catch (e) {
    //   WidgetHelper.hideProgress();
    // }
  }
}
