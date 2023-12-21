import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../screen_views/privacy_policy_view.dart';

class PrivacyPolicy extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  PrivacyPolicyController createState() => PrivacyPolicyController();
}

class PrivacyPolicyController extends State<PrivacyPolicy> {
  //... //Initialization code, state vars etc, all go here
  bool onNotification = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PrivacyPolicyView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  onSwitch(value) {
    setState(() => onNotification = value);
  }
}
