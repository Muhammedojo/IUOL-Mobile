import 'package:ioul/model/submit_application.dart';
import 'package:ioul/utils/utils.dart';
import 'package:ioul/values/values.dart';

import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../screen_views/personal_view.dart';

late SubmitApplication sub;

class Personal extends StatefulWidget {
  late SubmitApplication sub;
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

class PersonalController extends State<Personal>
    with AutomaticKeepAliveClientMixin {
  //... //Initialization code, state vars etc, all go here

  bool visible = false;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController middlenameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController maritalStatusController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedGender;
  String? maritalStatus;
  String? employmentStatus;
  String? selectedIDType;

  onNextPressed() {
    // if (widget.selectedIndex! < 6) {
    setState(() {
      widget.controller!.animateTo(1);
      widget.initialProgress!();
    });
    // }
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
              colorScheme: const ColorScheme.light(
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PersonalView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  validatePersonalInfo() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      var application = SubmitApplication();
      // var newApplication = SubmitApplication();

      application.firstName = firstNameController.text.trim();
      application.email = emailController.text.trim();
      application.gender = genderController.text.trim();
      application.middleName = middlenameController.text.trim();
      application.phone = phoneController.text.trim();
      application.identificationNumber = identityNumberController.text.trim();
      application.language = nativeLanguageController.text.trim();
      application.religion = religionController.text.trim();
      application.identificationType = nationalIdTypeController.text.trim();
      application.dob = dateOfBirthController.text.trim();
      application.maritalStatus = maritalStatusController.text.trim();
      application.lastName = surnameController.text.trim();
      application.occupation = employmentStatusController.text.trim();

      GlobalVariables.applications.value = application;
      //newApplication = GlobalVariables.applications.value;
      //print('${newApplication.identificationNumber}');
      onNextPressed();
    } else {
      WidgetHelper.showToastError(context, "Fill required field.");
      return;
    }
  }

  @override
  bool get wantKeepAlive => true;
}
