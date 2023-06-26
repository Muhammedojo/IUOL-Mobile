import 'dart:developer';

import 'package:ioul/values/values.dart';

import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../screen_views/application_form_view.dart';
import '../screen_views/personal_view.dart';
import '../utils/global_variables.dart';

class Personal extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  Personal({
    Key? key,
    this.selectedIndex,
    this.controller,
    this.initialProgress,
  }) : super(key: key);

  final int? selectedIndex;
  final TabController? controller;
  Function? initialProgress;

  @override
  PersonalController createState() => PersonalController();
}

class PersonalController extends State<Personal> {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController middlenameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController religionControllr = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController employmentStatusController =
      TextEditingController();
  final TextEditingController nativeLanguageController =
      TextEditingController();
  final TextEditingController nationalIdTypeController =
      TextEditingController();
  final TextEditingController identityNumberController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  // double initialProgress = (100 / 7 / 100);

  // setProgress(int value) {
  //   setState(() {
  //     GlobalVariables().initialProgress = (100 / 7 * 2 / 100);
  //   });
  //   log(GlobalVariables().initialProgress.toString());
  // }

  onNextPressed() {
    if (widget.selectedIndex! < 6) {
      setState(() {
        widget.controller!.animateTo(1);
        widget.initialProgress!();
      });
    }
  }

  String selectedValue = "";

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  showDatePickerDialog() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970),
      lastDate: DateTime(2200),
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
            primary: AppColors.primary,
          )),
          child: child!),
    );

    if (pickedDate != null) {
      setState(() {
        dateOfBirthController.text = pickedDate.toString();
      });
    }
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
  Widget build(BuildContext context) => PersonalView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
