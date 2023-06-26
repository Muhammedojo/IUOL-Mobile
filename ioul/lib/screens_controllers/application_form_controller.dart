import 'dart:developer';

import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../screen_views/application_form_view.dart';
import '../utils/global_variables.dart';

class ApplicationForm extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const ApplicationForm({Key? key}) : super(key: key);

  @override
  ApplicationFormController createState() => ApplicationFormController();
}

class ApplicationFormController extends State<ApplicationForm>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  //... //Initialization code, state vars etc, all go here

  @override
  bool get wantKeepAlive => true;

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

  late TabController tabController;

  int selectedIndex = 0;

  double initialProgress = (100 / 7 / 100);

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 7, vsync: this);
  }

  setInitialProgress(value) {
    setState(() {
      initialProgress = (100 / 7 * value / 100);
    });
    log("This is the new progress value ${initialProgress.toString()}");
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => ApplicationFormView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
