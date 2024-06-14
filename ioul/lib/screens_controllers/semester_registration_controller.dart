import '../screen_views/semester_registration_view.dart';
import 'package:flutter/material.dart';
import '../core/helpers/helper.dart';

class SemesterRegistration extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const SemesterRegistration({Key? key}) : super(key: key);

  @override
  SemesterRegistrationController createState() =>
      SemesterRegistrationController();
}

class SemesterRegistrationController extends State<SemesterRegistration> {
  //... //Initialization code, state vars etc, all go here

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController studyCenterController = TextEditingController();
  String? selectedStudyCenter = "";
  String? selectedState = "";

  String selectedValue = "";

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
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
  Widget build(BuildContext context) => SemesterRegistrationView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
