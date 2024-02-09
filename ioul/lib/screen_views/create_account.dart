import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ioul/bloc/register/cubit.dart';

import '../packages/package.dart';
import '../helpers/helper.dart';
import '../router/router.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/create_account.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class CreateAccountView
    extends StatelessView<CreateAccount, CreateAccountController> {
  const CreateAccountView(CreateAccountController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundWhite,
      appBar: WidgetHelper().appBackArrowOnly(context),
      body: WidgetWrapper(
        child: SingleChildScrollView(
          child: SizedBox(
            child: Form(
              key: state.formKey,
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 24),
                child: state.nextForms == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: 12.h),
                          TextWidget(
                            text: "Create an account",
                            style: Styles.x24dp_090A0A_700w(),
                          ),
                          // SizedBox(height: 8.h),
                          // TextWidget(
                          //   text: "Log in to your account",
                          //   style: Styles.x16dp_090A0A_400w(),
                          // ),
                          SizedBox(height: 26.h),
                          TextFieldWidget(
                            title: "First name",
                            controller: state.firstNameController,
                          ),
                          SizedBox(height: 20.h),
                          TextFieldWidget(
                            title: "Surname",
                            controller: state.surnameController,
                          ),
                          SizedBox(height: 20.h),
                          TextFieldWidget(
                            title: "Middle name",
                            controller: state.middlenameController,
                            textInputAction: TextInputAction.done,
                          ),
                          SizedBox(height: 108.h),
                          ElevatedButtonWidget(
                              title: "Continue",
                              onTap: () {
                                if (state.firstNameController.text.isEmpty ||
                                    state.surnameController.text.isEmpty) {
                                  WidgetHelper.showToastError(context,
                                      "Kindly fill the form before you proceed");
                                  return;
                                }

                                state.toggleNextForms();
                              }),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: "Already have an account? ",
                                style: Styles.x12dp_090A0A_400w(),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => NavigatorHelper(context)
                                              .pushNamedScreen(
                                            RouteConstants.login,
                                          ),
                                    text: "Sign in ",
                                    style: Styles.x12dp_4EAFFF_400w(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SizedBox(height: 12.h),
                          TextWidget(
                            text: "Create an account",
                            style: Styles.x24dp_090A0A_700w(),
                          ),
                          SizedBox(height: 26.h),
                          TextFormField(
                            style: Styles.x16dp_72777A_400w(),
                            controller: state.emailController,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              isDense: true,
                              contentPadding: REdgeInsets.all(16),
                              fillColor: AppColors.backgroundWhite,
                              filled: true,
                              labelText: "Email address",
                              hintStyle: Styles.x12dp_72777A_400w(),
                              labelStyle: Styles.x12dp_72777A_400w(),

                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.inkLight),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.inkLighter),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              // enabledBorder: OutlineInputBorder(
                              //   borderSide: BorderSide.none,
                              // ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20.h),
                          TextFormField(
                            style: Styles.x16dp_72777A_400w(),
                            controller: state.emailConfirmController,
                            decoration: InputDecoration(
                              isCollapsed: true,
                              isDense: true,
                              contentPadding: REdgeInsets.all(16),
                              fillColor: AppColors.backgroundWhite,
                              filled: true,
                              labelText: "Confirm Email address",
                              hintStyle: Styles.x12dp_72777A_400w(),
                              labelStyle: Styles.x12dp_72777A_400w(),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.inkLight),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.inkLighter),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          SizedBox(height: 20.h),
                          // TextFieldWidget(
                          //   title: "Phone number",
                          //   controller: state.phoneController,
                          // ),
                          IntlPhoneField(
                            initialCountryCode: 'NG',
                            languageCode: 'en',
                            controller: state.phoneController,
                            style: Styles.x16dp_72777A_400w(),
                            disableLengthCheck: false,
                            pickerDialogStyle: PickerDialogStyle(
                                backgroundColor: AppColors.primary,
                                searchFieldInputDecoration: InputDecoration(),
                                countryNameStyle: const TextStyle(
                                  color: AppColors.lightGrey,
                                )),
                            dropdownDecoration: const BoxDecoration(),
                            dropdownTextStyle: Styles.x16dp_72777A_400w(),
                            decoration: InputDecoration(
                              helperStyle: Styles.x16dp_72777A_400w(),
                              hintTextDirection: TextDirection.ltr,

                              contentPadding: REdgeInsets.only(
                                  top: 16, right: 16, bottom: 16, left: 0),
                              hintStyle: Styles.x12dp_72777A_400w(),
                              fillColor: AppColors.backgroundWhite,
                              filled: false,
                              // isDense: true,
                              isCollapsed: true,
                              hintText: 'Phone Number',

                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColors.inkLight),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: AppColors.inkLighter),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            onChanged: (value) =>
                                state.phoneController.text = value.number,
                          ),
                          SizedBox(height: 20.h),
                          TextFieldWidget(
                            title: "Password",
                            controller: state.passwordController,
                            obscureText: state.visible,
                            passwordIcon: InkWell(
                              onTap: () => state.toggleVisibility(),
                              child: Icon(
                                state.visible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 22.w.h,
                                color: AppColors.inkDarkest,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextFieldWidget(
                            title: "Confirm password",
                            controller: state.passwordConfirmController,
                            obscureText: state.confirmVisible,
                            textInputAction: TextInputAction.done,
                            passwordIcon: InkWell(
                              onTap: () => state.toggleConfirmVisibility(),
                              child: Icon(
                                state.confirmVisible
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 22.w.h,
                                color: AppColors.inkDarkest,
                              ),
                            ),
                          ),
                          SizedBox(height: 176.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                activeColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                value: state.checked,
                                onChanged: (e) => state.toggleCheck(),
                              ),
                              SizedBox(width: 8.w),
                              RichText(
                                text: TextSpan(
                                  text: "I agree with the ",
                                  style: Styles.x14dp_090A0A_500w(),
                                  children: [
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TermsAndServices()),
                                            ),
                                      text: "Terms and Conditions ",
                                      style: Styles.x12dp_4EAFFF_400w(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          BlocListener<RegisterCubit, RegisterState>(
                            listener: (context, registerState) {
                              if (registerState is RegisterLoading) {
                                WidgetHelper.showProgress(text: 'Processing');
                              }
                              if (registerState is RegisterLoaded) {
                                WidgetHelper.hideProgress();
                                context.pushNamed(
                                    RouteConstants.accountVerification,
                                    extra: registerState
                                            .registerStudent.data?.email ??
                                        "");
                              }
                              if (registerState is RegisterFailure) {
                                WidgetHelper.hideProgress();
                                WidgetHelper.showToastError(
                                  context,
                                  registerState.message,
                                );
                              }
                            },
                            child: ElevatedButtonWidget(
                                title: "Submit",
                                onTap: () {
                                  state.validateConfirmEmail();
                                }),
                          ),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: "Already have an account? ",
                                style: Styles.x12dp_090A0A_400w(),
                                children: [
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => NavigatorHelper(context)
                                              .pushNamedScreen(
                                            RouteConstants.login,
                                          ),
                                    text: "Sign in ",
                                    style: Styles.x12dp_4EAFFF_400w(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
