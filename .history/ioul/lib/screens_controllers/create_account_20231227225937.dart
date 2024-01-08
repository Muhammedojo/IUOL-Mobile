import 'package:ioul/bloc/register/cubit.dart';
import 'package:ioul/model/register_student.dart';

import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../packages/package.dart';
import '../router/router.dart';
import '../screen_views/create_account.dart';

class CreateAccount extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const CreateAccount({Key? key}) : super(key: key);

  @override
  CreateAccountController createState() => CreateAccountController();
}

class CreateAccountController extends State<CreateAccount> {
  //... //Initialization code, state vars etc, all go here

  bool visible = true;
  bool confirmVisible = true;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController middlenameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController emailConfirmController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool nextForms = false;
  String email = "";
  String confirmEmail = "";
  bool checked = false;

  toggleVisibility() {
    setState(() {
      visible = !visible;
    });
  }

  toggleConfirmVisibility() {
    setState(() {
      confirmVisible = !confirmVisible;
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
  Widget build(BuildContext context) => CreateAccountView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  bool isValidEmail(String email) {
    // Regular expression for a valid email address
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  void validateConfirmEmail() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      // Perform actions with the validated email and confirmEmail
      String email = emailController.text.trim();
      String firstName = firstNameController.text.trim();
      String lastName = surnameController.text.trim();
      String checkEmail = emailConfirmController.text.trim();
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();
      String confirmPassword = passwordConfirmController.text.trim();

      if (firstName.isEmpty) {
        WidgetHelper.showToastError(context, "First name is required.");
        return;
      }
      if (lastName.isEmpty) {
        WidgetHelper.showToastError(context, "Surname name is required.");
        return;
      }
      if (email.isEmpty) {
        WidgetHelper.showToastError(context, "Email is required.");
        return;
      } else if (!isValidEmail(email)) {
        WidgetHelper.showToastError(context, "Invalid email address.");
        return;
      }

      if (checkEmail.isEmpty) {
        WidgetHelper.showToastError(context, "Confirm email is required.");
        return;
      } else if (checkEmail != email) {
        WidgetHelper.showToastError(context, "Email do not matched.");
        return;
      } else if (!isValidEmail(checkEmail)) {
        WidgetHelper.showToastError(context, "Invalid email address.");
        return;
      }

      if (phone.isEmpty) {
        WidgetHelper.showToastError(context, "Phone number is required.");
        return;
      }
      if (password.isEmpty) {
        WidgetHelper.showToastError(context, "Password is required.");
        return;
      }
      if (confirmPassword.isEmpty) {
        WidgetHelper.showToastError(context, "Confirm password is required.");
        return;
      }
    }
    registerStudent();
  }

  void registerStudent() async {
    // try {
    // WidgetHelper.showProgress(text: 'Processing');
    var register = Register();
    register.firstName = firstNameController.text.trim();
    register.email = emailConfirmController.text.trim();
    register.lastName = surnameController.text.trim();
    register.middleName = middlenameController.text.trim();
    register.password = passwordController.text.trim();
    register.passwordConfirmation = passwordConfirmController.text.trim();
    register.phone = phoneController.text.trim();

    context.read<RegisterCubit>().pushRegisterationToServer(register);
    // WidgetHelper.hideProgress();
    // context.pushNamed(RouteConstants.accountVerification);
    // } catch (e) {
    //   // WidgetHelper.hideProgress();
    // }
  }

  @override
  void dispose() {
    emailConfirmController.dispose();
    firstNameController.dispose();
    surnameController.dispose();
    middlenameController.dispose();
    phoneController.dispose();
    emailConfirmController.dispose();
    passwordConfirmController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
