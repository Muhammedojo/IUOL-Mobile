import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../../more/presentation/bloc/bloc.dart';
import '../bloc/application_form_data/cubit.dart';
import '../controller/application_controller.dart';

class ApplicationView
    extends StatelessView<Application, ApplicationController> {
  const ApplicationView(ApplicationController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("application_form".tr())),
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 4.h,
          margin: REdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: LinearProgressIndicator(
            value: (state.currentStep + 1) / state.tabs.length,
            backgroundColor: AppColors.skyLightest,
            valueColor: const AlwaysStoppedAnimation(AppColors.primary),
          ),
        ),
        Container(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            controller: state.tabScrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(state.tabs.length, (index) {
                return Padding(
                  padding: REdgeInsets.symmetric(horizontal: 8),
                  child: _buildNavTab(
                      state.tabs[index], index == state.currentStep),
                );
              }),
            ),
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: SingleChildScrollView(
            padding: REdgeInsets.all(16),
            child: Form(
              key: state.formKey,
              child: buildCurrentStepContent(context),
            ),
          ),
        ),
        Container(
          padding: REdgeInsets.all(16),
          child: Row(
            children: [
              if (state.currentStep > 0)
                Expanded(
                  flex: 1,
                  child: ElevatedButtonWidget(
                      onTap: () => state.previous(), title: "back".tr()),
                ),
              if (state.currentStep > 0 &&
                  state.currentStep < state.tabs.length - 1)
                16.horizontalSpace,
              Expanded(
                flex: 1,
                child: ElevatedButtonWidget(
                  onTap: () {
                    if (state.formKey.currentState!.validate()) {
                      if (state.currentStep < state.tabs.length - 1) {
                        state.next();
                      } else {
                        state.submitForm();
                      }
                    }
                  },
                  title: state.currentStep < state.tabs.length - 1
                      ? 'next'.tr()
                      : 'Submit'.tr(),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCurrentStepContent(context) {
    switch (state.currentStep) {
      case 0:
        return _buildPersonalForm(context);
      case 1:
        return _buildAddressForm(context);
      case 2:
        return _buildContactsForm(context);
      case 3:
        return _buildSponsorForm(context);
      case 4:
        return _buildProgramForm(context);
      case 5:
        return _buildCertificateForm(context);
      case 6:
        return _buildUploadForm(context);
      default:
        return Container();
    }
  }

  Widget _buildPersonalForm(context) {
    return Column(
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

            contentPadding:
                REdgeInsets.only(top: 16, right: 16, bottom: 16, left: 0),
            hintStyle: Styles.x12dp_72777A_400w(),
            fillColor: AppColors.backgroundWhite,
            filled: false,
            // isDense: true,
            isCollapsed: true,
            hintText: 'phone_number'.tr(),

            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.inkLight),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.inkLighter),
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
            child:
                BlocBuilder<ApplicationFormDataCubit, ApplicationFormDataState>(
              builder: (context, applicationState) {
                if (applicationState is ApplicationFormDataLoaded) {
                  return CustomDropdownWidget(
                    dropdownList:
                        applicationState.formData.maritalStatuses ?? [],
                    controller: state.maritalStatusController,
                    onChange: (value) => state.setSelectedValue(value),
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
                  onChange: (value) => state.setSelectedValue(value),
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
            child:
                BlocBuilder<ApplicationFormDataCubit, ApplicationFormDataState>(
              builder: (context, applicationState) {
                if (applicationState is ApplicationFormDataLoaded) {
                  return CustomDropdownWidget(
                    dropdownList: applicationState.formData.religions ?? [],
                    controller: state.religionController,
                    onChange: (value) => state.setSelectedValue(value),
                  );
                }
                return CustomDropdownWidget(
                  dropdownList: const [
                    'Islam',
                    'Christianity',
                    'Others',
                  ],
                  controller: state.religionController,
                  onChange: (value) => state.setSelectedValue(value),
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
            child:
                BlocBuilder<ApplicationFormDataCubit, ApplicationFormDataState>(
              builder: (context, applicationState) {
                if (applicationState is ApplicationFormDataLoaded) {
                  return CustomDropdownWidget(
                    dropdownList:
                        applicationState.formData.identificationTypes ?? [],
                    controller: state.nationalIdTypeController,
                    onChange: (value) => state.setSelectedValue(value),
                  );
                }
                return CustomDropdownWidget(
                  dropdownList: const [
                    'Voters Card',
                    'NIN',
                    "National Identity Card",
                  ],
                  controller: state.nationalIdTypeController,
                  onChange: (value) => state.setSelectedValue(value),
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
      ],
    );
  }

  Widget _buildAddressForm(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "nationality".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        BlocBuilder<CountryCubit, CountryState>(builder: (context, states) {
          if (states is CountryLoaded) {
            List<String> countries = [];
            states.response.data?.forEach((e) => countries.add(e.name ?? ""));
            return Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomDropdown(
                  borderSide: BorderSide(
                    color: AppColors.inkLight,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                  hintText: 'select'.tr(),
                  items: countries,
                  controller: state.nationalityController,
                  selectedStyle: Styles.x16dp_72777A_400w(),
                  listItemStyle: Styles.x16dp_000000_400w(),
                  // fieldSuffixIcon: ,
                  onChanged: (value) => state.onSelectCountry(value),
                ),
              ),
            );
          }
          return Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomDropdownWidget(
                dropdownList: const ['Nigeria'],
                controller: state.countryController,
                onChange: (value) => state.setSelectedValue(value),
              ),
            ),
          );
        }),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "state".tr(),
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
                'Kaduna',
                'Sokoto',
                'Yobe',
                'Oyo',
              ],
              controller: state.stateController,
              onChange: (value) => state.setSelectedValue(value),
            ),
          ),
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "lga".tr(),
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
                'Binji',
                'Bodinga',
                'Gada',
                'Gudu',
                'Kebbi',
                'Sokoto South',
                'Tambuwal',
                'Sabon Birnin',
                'Shagari',
              ],
              controller: state.lgaController,
              onChange: (value) => state.setSelectedValue(value),
            ),
          ),
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "residence_country".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        BlocBuilder<CountryCubit, CountryState>(builder: (context, states) {
          if (states is CountryLoaded) {
            List<String> countries = [];
            states.response.data?.forEach((e) => countries.add(e.name ?? ""));
            return Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CustomDropdown(
                  borderSide: BorderSide(
                    color: AppColors.inkLight,
                    width: 1.w,
                  ),
                  borderRadius: BorderRadius.circular(8.r),
                  hintText: 'select'.tr(),
                  items: countries,
                  controller: state.countryController,
                  selectedStyle: Styles.x16dp_72777A_400w(),
                  listItemStyle: Styles.x16dp_000000_400w(),
                  // fieldSuffixIcon: ,
                  onChanged: (value) => state.onSelectCountry(value),
                ),
              ),
            );
          }
          return Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomDropdownWidget(
                dropdownList: const ['Nigeria'],
                controller: state.countryController,
                onChange: (value) => state.setSelectedValue(value),
              ),
            ),
          );
        }),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "residence_state".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "state".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.stateOfResidenceController,
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "permanent_address".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "address".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.permanentAddressController,
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "work_address".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "work_address".tr(),
          controller: state.workAddressController,
          onValidate: ValidationBuilder().required().build(),
        ),
        SizedBox(height: 28.h),
      ],
    );
  }

  Widget _buildContactsForm(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "nok_name".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "fullname".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.nokNameController,
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "nok_email".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "example@example.com",
          onValidate: ValidationBuilder().required().build(),
          controller: state.nokEmailController,
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "nok_phone".tr(),
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
          controller: state.nokPhoneController,
          style: Styles.x16dp_72777A_400w(),
          disableLengthCheck: true,
          cursorColor: AppColors.lightGrey,
          dropdownDecoration: const BoxDecoration(),
          dropdownTextStyle: Styles.x16dp_72777A_400w(),
          decoration: InputDecoration(
            helperStyle: Styles.x16dp_72777A_400w(),

            contentPadding:
                REdgeInsets.only(top: 16, right: 16, bottom: 16, left: 0),
            hintStyle: Styles.x12dp_72777A_400w(),
            fillColor: AppColors.backgroundWhite,
            filled: true,
            // isDense: true,
            isCollapsed: true,
            hintText: 'phone_number'.tr(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.inkLight),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.inkLighter),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onChanged: (value) {
            state.nokCountryCode = value.countryCode;
            state.nokPhoneController.text = value.number;
          },
          onCountryChanged: (country) {
            state.nokCountryCode = country.dialCode;
          },
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "nok_address".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "address".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.nokAddressController,
        ),
        SizedBox(height: 28.h),
        TextWidget(
          text: "referee".tr(),
          style: Styles.x16dp_202325_700w(),
        ),
        SizedBox(height: 6.h),
        const Divider(
          color: AppColors.inkBase,
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "referee_name".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "fullname".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.refNameController,
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "referee_email".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "example@example.com",
          onValidate: ValidationBuilder().required().build(),
          controller: state.refEmailController,
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "referee_phone".tr(),
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
          controller: state.refPhoneController,
          style: Styles.x16dp_72777A_400w(),
          disableLengthCheck: true,
          cursorColor: AppColors.lightGrey,
          dropdownDecoration: const BoxDecoration(),
          dropdownTextStyle: Styles.x16dp_72777A_400w(),
          decoration: InputDecoration(
            helperStyle: Styles.x16dp_72777A_400w(),

            contentPadding:
                REdgeInsets.only(top: 16, right: 16, bottom: 16, left: 0),
            hintStyle: Styles.x12dp_72777A_400w(),
            fillColor: AppColors.backgroundWhite,
            filled: true,
            // isDense: true,
            isCollapsed: true,
            hintText: 'phone'.tr(),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.inkLight),
              borderRadius: BorderRadius.circular(8.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.inkLighter),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          onChanged: (value) {
            state.refCountryCode = value.countryCode;
            state.refPhoneController.text = value.number;
          },
          onCountryChanged: (country) {
            state.refCountryCode = country.dialCode;
          },
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "referee_address".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "address".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.refAddressController,
        ),
        SizedBox(height: 28.h),
      ],
    );
  }

  Widget _buildSponsorForm(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "sponsor".tr(),
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
            child:
                BlocBuilder<ApplicationFormDataCubit, ApplicationFormDataState>(
              builder: (context, applicationState) {
                if (applicationState is ApplicationFormDataLoaded) {
                  return CustomDropdownWidget(
                    dropdownList: applicationState.formData.sponsors ?? [],
                    controller: state.sponsorController,
                    onChange: (value) => state.setSelectedValue(value),
                  );
                }

                return CustomDropdownWidget(
                  dropdownList: const ["Government"],
                  controller: state.sponsorController,
                  onChange: (value) => state.setSelectedValue(value),
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
              text: "sponsor_name".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "name".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.sponsorNameController,
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "sponsor_address".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "address".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.sponsorAddressController,
        ),
      ],
    );
  }

  Widget _buildProgramForm(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "Programme applying for",
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
            child:
                BlocBuilder<ApplicationFormDataCubit, ApplicationFormDataState>(
              builder: (context, applicationState) {
                if (applicationState is ApplicationFormDataLoaded) {
                  return CustomDropdownWidget(
                      dropdownList: applicationState.formData.programmes ?? [],
                      controller: state.programController,
                      onChange: (String value) => state.onSelectProgramme(value)
                      //setSelectedValue(value),
                      );
                }
                return CustomDropdownWidget(
                    dropdownList: const ["B.Sc. Carpentry"],
                    controller: state.programController,
                    onChange: (value) => state.onSelectProgramme(value));
              },
            ),
          ),
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "Highest qualification obtained",
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
            child:
                BlocBuilder<ApplicationFormDataCubit, ApplicationFormDataState>(
              builder: (context, applicationState) {
                if (applicationState is ApplicationFormDataLoaded) {
                  return CustomDropdownWidget(
                    dropdownList:
                        applicationState.formData.underGraduateQualifications ??
                            [],
                    controller: state.highestQualificationController,
                    onChange: (value) => state.setSelectedValue(value),
                  );
                }
                return CustomDropdownWidget(
                  dropdownList: const [
                    'SSCE',
                    'NCE',
                    'OND',
                    'ND',
                  ],
                  controller: state.highestQualificationController,
                  onChange: (value) => state.setSelectedValue(value),
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
              text: "Qualification Applying with",
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
            child:
                BlocBuilder<ApplicationFormDataCubit, ApplicationFormDataState>(
              builder: (context, applicationState) {
                if (applicationState is ApplicationFormDataLoaded) {
                  return CustomDropdownWidget(
                    dropdownList:
                        applicationState.formData.postGraduateQualifications ??
                            [],
                    controller: state.qualificationController,
                    onChange: (value) => state.setSelectedValue(value),
                  );
                }
                return CustomDropdownWidget(
                  dropdownList: const ['SSCE', 'NCE', 'OND', 'ND', 'Bachelor'],
                  controller: state.qualificationController,
                  onChange: (value) => state.setSelectedValue(value),
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
              text: "Level applying for",
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
                'Undergraduate',
                '100',
                '200',
                '300',
                '400',
              ],
              controller: state.levelController,
              onChange: (value) => state.setSelectedValue(value),
            ),
          ),
        ),
        28.verticalSpace,
      ],
    );
  }

  Widget _buildCertificateForm(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "type_of_certificate".tr(),
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
            child:
                BlocBuilder<ApplicationFormDataCubit, ApplicationFormDataState>(
              builder: (context, applicationState) {
                if (applicationState is ApplicationFormDataLoaded) {
                  return CustomDropdownWidget(
                    dropdownList: applicationState.formData.certificates ?? [],
                    controller: state.certificateTypeController,
                    onChange: (value) => state.setSelectedValue(value),
                  );
                }
                return CustomDropdownWidget(
                  dropdownList: const ['SSCE', 'NCE', 'OND', 'ND', 'Bachelor'],
                  controller: state.certificateTypeController,
                  onChange: (value) => state.setSelectedValue(value),
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
              text: "exam_center_name".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "exam_center_name".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.centerNameController,
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "exam_centre_no".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "center_no".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.centerNumberController,
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "candidate_exam_no".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "exam_number".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.examNumberController,
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "exam_year".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 10.w),
        TextFieldWidget(
          hint: "exam_year".tr(),
          onValidate: ValidationBuilder().required().build(),
          controller: state.examYearController,
        ),
        28.verticalSpace,
      ],
    );
  }

  Widget _buildUploadForm(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "passport".tr(),
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 14.h),
        state.passportImage != null
            ? Text(
                '${state.passportImage?.path}',
                style: Styles.x14dp_090A0A_500w(),
              )
            : const SizedBox.shrink(),
        OutlinedButtonWidget(
          onTap: () {
            state.choosePassport(
                ImageSource.gallery, state.passportImageController);
          },
          title: "choose_file".tr(),
          imagePath: "assets/images/upload.svg",
        ),
        SizedBox(height: 10.h),
        TextWidget(
          text:
              "Please note that you can only upload JPEG files that do not exceed 2MiB. The photo will be cut to the ‘standard’ passport  size of 35 x 45 mm",
          style: Styles.x8dp_979C9E_400w(),
        ),
        SizedBox(height: 28.h),
        TextWidget(
          text:
              "Please Upload the following documents/certificates as application requirement.Make sure you read the requirements for the programme chosen. Scan and upload certificates in one(1) PDF file.",
          style: Styles.x16dp_202325_400w(),
        ),
        SizedBox(height: 18.h),
        Row(
          children: [
            TextWidget(
              text: "1.",
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 8.w),
            TextWidget(
              text: "SSCE / O' Level / A' Level",
              style: Styles.x16dp_202325_400w(),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            TextWidget(
              text: "2.",
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 8.w),
            TextWidget(
              text: "Birth Certificate",
              style: Styles.x16dp_202325_400w(),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            TextWidget(
              text: "3.",
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 8.w),
            TextWidget(
              text: "Nationality/Identification Card",
              style: Styles.x16dp_202325_400w(),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            TextWidget(
              text: "4.",
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 8.w),
            TextWidget(
              text: "Primary Certificate",
              style: Styles.x16dp_202325_400w(),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "5.",
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: TextWidget(
                text:
                    "Including any other certificates for special courses, direct entry and postgraduate candidates requirements",
                style: Styles.x16dp_202325_400w(),
                maxLines: 2,
              ),
            ),
          ],
        ),
        SizedBox(height: 28.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextWidget(
              text: "Document",
              style: Styles.x16dp_202325_400w(),
            ),
            SizedBox(width: 10.w),
            SvgPicture.asset("assets/images/red_star.svg"),
          ],
        ),
        SizedBox(height: 14.h),
        state.documentImage != null
            ? Text(
                '${state.documentImage?.uri}',
                style: Styles.x14dp_090A0A_500w(),
              )
            : const SizedBox.shrink(),
        OutlinedButtonWidget(
          onTap: () {
            state.chooseDocument(state.pdfDocumentController);
          },
          title: "choose_file".tr(),
          imagePath: "assets/images/upload.svg",
        ),
        SizedBox(height: 12.h),
        TextWidget(
          text: "Please note that you can only upload .pdf file",
          style: Styles.x8dp_979C9E_400w(),
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            // Checkbox(
            //     value: false,
            //     onChanged: (e) {
            //       state.visible;
            //     }),
            Checkbox(
              activeColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              value: state.checked,
              onChanged: (e) => state.toggleCheck(),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  text: "I agree with the  ",
                  style: Styles.x12dp_090A0A_400w(),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: "Terms and Conditions ",
                      style: Styles.x12dp_4EAFFF_400w(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        28.verticalSpace,

        // Expanded(
        //   flex: 1,
        //   child:
        //       BlocListener<SubmitApplicationCubit, SubmitApplicationState>(
        //     listener: (context, applicationState) {
        //       if (applicationState is SubmitApplicationLoading) {
        //         WidgetHelper.showProgress(text: 'processing'.tr());
        //       }
        //       if (applicationState is SubmitApplicationLoaded) {
        //         WidgetHelper.hideProgress();
        //         context.goNamed(RouteConstants.reviewApplication);
        //       }
        //       if (applicationState is SubmitApplicationFailure) {
        //         WidgetHelper.hideProgress();
        //         WidgetHelper.showToastError(
        //           context,
        //           applicationState.message,
        //         );
        //       }
        //     },
        //     child: ElevatedButtonWidget(
        //         onTap: () {
        //           state.validateUploads();
        //         },
        //         title: "review".tr()),
        //   ),
        // )
      ],
    );
  }

  Widget _buildNavTab(String title, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: REdgeInsets.symmetric(vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.blue : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        if (isActive)
          Container(
            height: 3,
            width: 40,
            color: Colors.blue.shade800,
          ),
      ],
    );
  }
}
