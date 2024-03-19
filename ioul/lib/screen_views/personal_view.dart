import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ioul/bloc/application_form_data/application_form_data_cubit.dart';
import 'package:ioul/components/elevated_button_widget.dart';
import 'package:ioul/components/text_widget.dart';
import 'package:ioul/components/textfield_widget.dart';
import 'package:ioul/utils/utils.dart';
import 'package:ioul/values/styles.dart';
import '../bloc/bloc.dart';
import '../components/custom_dropdown_widget.dart';
import '../screens_controllers/personal_controller.dart';
import '../values/colors.dart';
import 'stateless_view.dart';

class PersonalView extends StatelessView<Personal, PersonalController> {
  const PersonalView(PersonalController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.transparent,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: ValueListenableBuilder(
            valueListenable: GlobalVariables.applications,
            builder: (context, value, child) {
              return Form(
                key: state.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "First Name",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "Sulaiman",
                      controller: state.firstNameController,
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Surname Name",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "Idris",
                      controller: state.surnameController,
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Middle Name",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "Ayodele",
                      controller: state.middlenameController,
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Email address",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "spythonian@gmail.com",
                      controller: state.emailController,
                      onValidate: ValidationBuilder().required().build(),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Gender",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: BlocBuilder<ApplicationFormDataCubit,
                            ApplicationFormDataState>(
                          builder: (context, applicationState) {
                            if (applicationState is ApplicationFormDataLoaded) {
                              return CustomDropdownWidget(
                                dropdownList:
                                    applicationState.formData.genders ?? [],
                                controller: state.genderController,
                                onChange: (value) =>
                                    state.setSelectedValue(value),
                              );
                            }
                            return CustomDropdownWidget(
                              dropdownList: const [
                                'Male',
                                'Female',
                              ],
                              controller: state.genderController,
                              onChange: (value) =>
                                  state.setSelectedValue(value),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Phone Number",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
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
                          borderSide:
                              const BorderSide(color: AppColors.inkLighter),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onChanged: (value) =>
                          state.phoneController.text = value.number,
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Marital Status",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: BlocBuilder<ApplicationFormDataCubit,
                            ApplicationFormDataState>(
                          builder: (context, applicationState) {
                            if (applicationState is ApplicationFormDataLoaded) {
                              return CustomDropdownWidget(
                                dropdownList:
                                    applicationState.formData.maritalStatuses ??
                                        [],
                                controller: state.maritalStatusController,
                                onChange: (value) =>
                                    state.setSelectedValue(value),
                              );
                            }
                            return CustomDropdownWidget(
                              dropdownList: const [
                                'Single',
                                'Married',
                                'Divorced',
                                'Widow',
                              ],
                              controller: state.maritalStatusController,
                              onChange: (value) =>
                                  state.setSelectedValue(value),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Religion",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: BlocBuilder<ApplicationFormDataCubit,
                            ApplicationFormDataState>(
                          builder: (context, applicationState) {
                            if (applicationState is ApplicationFormDataLoaded) {
                              return CustomDropdownWidget(
                                dropdownList:
                                    applicationState.formData.religions ?? [],
                                controller: state.religionController,
                                onChange: (value) =>
                                    state.setSelectedValue(value),
                              );
                            }
                            return CustomDropdownWidget(
                              dropdownList: const [
                                'Islam',
                                'Christianity',
                                'Traditionalist',
                              ],
                              controller: state.religionController,
                              onChange: (value) =>
                                  state.setSelectedValue(value),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Employment Status",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: BlocBuilder<ApplicationFormDataCubit,
                            ApplicationFormDataState>(
                          builder: (context, applicationState) {
                            if (applicationState is ApplicationFormDataLoaded) {
                              return CustomDropdownWidget(
                                dropdownList: const [
                                  'Employed',
                                  'Unemployed',
                                  'under employed'
                                ],
                                controller: state.employmentStatusController,
                                onChange: (value) =>
                                    state.setSelectedValue(value),
                              );
                            }
                            return CustomDropdownWidget(
                              dropdownList: const [
                                'Employed',
                                'Unemployed',
                              ],
                              controller: state.employmentStatusController,
                              onChange: (value) =>
                                  state.setSelectedValue(value),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Date of Birth",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    GestureDetector(
                      onTap: () => state.showDatePickerDialog(),
                      child: AbsorbPointer(
                        child: TextFieldWidget(
                          hint: "Date of Birth",
                          readOnly: true,
                          controller: state.dateOfBirthController,
                          passwordIcon: const Icon(
                            Icons.date_range_outlined,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Native Language",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "Native language",
                      controller: state.nativeLanguageController,
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "National Identification Type",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: BlocBuilder<ApplicationFormDataCubit,
                            ApplicationFormDataState>(
                          builder: (context, applicationState) {
                            if (applicationState is ApplicationFormDataLoaded) {
                              return CustomDropdownWidget(
                                dropdownList: applicationState
                                        .formData.identificationTypes ??
                                    [],
                                controller: state.nationalIdTypeController,
                                onChange: (value) =>
                                    state.setSelectedValue(value),
                              );
                            }
                            return CustomDropdownWidget(
                              dropdownList: const [
                                'Permanent Voters Card',
                                'NIN',
                                'International Passport',
                                "Driver's License",
                              ],
                              controller: state.nationalIdTypeController,
                              onChange: (value) =>
                                  state.setSelectedValue(value),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Identification Number",
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "0000000000000",
                      controller: state.identityNumberController,
                      keyboardType: TextInputType.number,
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 28.h),
                    ElevatedButtonWidget(
                        onTap: () {
                          state.validatePersonalInfo();
                        },
                        title: "Next")
                  ],
                ),
              );
            }),
      ),
    );
  }
}
