import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../screen_views/terms_and_services_view.dart';

class TermsAndServices extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const TermsAndServices({Key? key}) : super(key: key);

  @override
  TermsAndServicesController createState() => TermsAndServicesController();
}

class TermsAndServicesController extends State<TermsAndServices> {
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
  Widget build(BuildContext context) => TermsAndServicesView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  onSwitch(value) {
    setState(() => onNotification = value);
  }
}
