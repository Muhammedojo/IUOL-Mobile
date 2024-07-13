import 'package:form_validator/form_validator.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ioul/components/elevated_button_widget.dart';
import 'package:ioul/components/text_widget.dart';
import 'package:ioul/components/textfield_widget.dart';
import '../../../../components/custom_dropdown_widget.dart';
import '../../../../core/core.dart';
import '../controller/personal_controller.dart';
import '../../../../screen_views/stateless_view.dart';

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
                          text: "firstname".tr(),
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "Ojo",
                      controller: state.firstNameController,
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "surname".tr(),
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "Muhammad",
                      controller: state.surnameController,
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "middlename".tr(),
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
                          text: "email".tr(),
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "s******@gmail.com",
                      controller: state.emailController,
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "gender".tr(),
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
                        child: CustomDropdownWidget(
                          dropdownList: const [
                            'Male',
                            'Female',
                            'Others',
                          ],
                          controller: state.genderController,
                          onChange: (value) => state.setSelectedValue(value),
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "phone_number".tr(),
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
                          searchFieldInputDecoration: const InputDecoration(),
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
                        hintText: 'phone_number'.tr(),

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
                      onChanged: (value) {
                        state.countryCode = value.countryCode;
                        state.phoneController.text = value.number;
                      },
                      onCountryChanged: (country) {
                        state.countryCode = country.dialCode;
                      },
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "marital_status".tr(),
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
                                'Others',
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
                          text: "religion".tr(),
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
                                'Others',
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
                          text: "employment_status".tr(),
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
                        child: CustomDropdownWidget(
                          dropdownList: const [
                            'Employed',
                            'Unemployed',
                          ],
                          controller: state.employmentStatusController,
                          onChange: (value) => state.setSelectedValue(value),
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "dob".tr(),
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "dob".tr(),
                      readOnly: true,
                      controller: state.dateOfBirthController,
                      passwordIcon: GestureDetector(
                        onTap: () => state.showDatePickerDialog(),
                        child: const Icon(
                          Icons.date_range_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "native_language".tr(),
                          style: Styles.x16dp_202325_400w(),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset("assets/images/red_star.svg"),
                      ],
                    ),
                    SizedBox(height: 10.w),
                    TextFieldWidget(
                      hint: "native_language".tr(),
                      controller: state.nativeLanguageController,
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 28.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "national_identification_type".tr(),
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
                                'Voters Card',
                                'NIN',
                                "National Identity Card",
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
                          text: "identification_number".tr(),
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
                      onValidate: ValidationBuilder().required().build(),
                    ),
                    SizedBox(height: 28.h),
                    ElevatedButtonWidget(
                        onTap: () {
                          state.validatePersonalInfo();
                        },
                        title: "next".tr())
                  ],
                ),
              );
            }),
      ),
    );
  }
}
