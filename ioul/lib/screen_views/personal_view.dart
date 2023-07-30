import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ioul/components/elevated_button_widget.dart';
import 'package:ioul/components/text_widget.dart';
import 'package:ioul/components/textfield_widget.dart';
import 'package:ioul/values/styles.dart';
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
              controller: state.firstNameController,
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
              hint: "Ademola",
              controller: state.firstNameController,
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
              controller: state.firstNameController,
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
                child: CustomDropdownWidget(
                  dropdownList: const [
                    'Male',
                    'Female',
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
                  text: "Phone Number",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            // IntlPhoneField(
            //   initialCountryCode: 'NG',
            //   disableAutoFillHints: true,
            //   disableLengthCheck: true,
            //   controller: state.phoneController,
            //   style: Styles.x16dp_72777A_400w(),
            //   dropdownIconPosition: IconPosition.trailing,
            //   dropdownIcon: const Icon(Icons.arrow_drop_down),
            //   flagsButtonMargin: const EdgeInsets.all(0),
            //   flagsButtonPadding: const EdgeInsets.only(left: 16),
            //   cursorHeight: 0,
            //   cursorRadius: Radius.circular(0),
            //   showCountryFlag: true,
            //   decoration: InputDecoration(
            //     contentPadding:
            //         REdgeInsets.only(top: 16, right: 16, bottom: 16, left: 0),
            //     hintStyle: Styles.x12dp_72777A_400w(),
            //     fillColor: AppColors.backgroundWhite,
            //     filled: true,
            //     isDense: true,
            //     isCollapsed: true,
            //     hintText: 'Phone Number',
            //     enabledBorder: OutlineInputBorder(
            //       borderSide: const BorderSide(color: AppColors.inkLight),
            //       borderRadius: BorderRadius.circular(8.r),
            //     ),
            //     focusedBorder: OutlineInputBorder(
            //       borderSide: const BorderSide(color: AppColors.inkLighter),
            //       borderRadius: BorderRadius.circular(8.r),
            //     ),
            //   ),
            //   languageCode: "en",
            //   onChanged: (phone) {
            //     print(phone.completeNumber);
            //   },
            //   onCountryChanged: (country) {
            //     print('Country changed to: ' + country.name);
            //   },
            // ),
            IntlPhoneField(
              initialCountryCode: 'NG',
              languageCode: 'en',
              controller: state.phoneController,
              style: Styles.x16dp_72777A_400w(),
              disableLengthCheck: true,
              cursorColor: AppColors.lightGrey,
              dropdownDecoration: BoxDecoration(),
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
                hintText: 'Phone Number',
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.inkLight),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.inkLighter),
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              onChanged: (value) => state.phoneController.text = value.number,
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
                child: CustomDropdownWidget(
                  dropdownList: const [
                    'Single',
                    'Married',
                    'Divorced',
                    'Widow',
                  ],
                  controller: state.maritalStatusController,
                  onChange: (value) => state.setSelectedValue(value),
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
                child: CustomDropdownWidget(
                  dropdownList: const [
                    'Islam',
                    'Christianity',
                    'Traditionalist',
                  ],
                  controller: state.religionControllr,
                  onChange: (value) => state.setSelectedValue(value),
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
                  text: "Date of Birth",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            TextFieldWidget(
              hint: "Date of Birth",
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
                child: CustomDropdownWidget(
                  dropdownList: const [
                    'Permanent Voters Card',
                    'NIN',
                    'International Passport',
                    "Driver's License",
                  ],
                  controller: state.nationalIdTypeController,
                  onChange: (value) => state.setSelectedValue(value),
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
            ),
            SizedBox(height: 28.h),
            ElevatedButtonWidget(
                onTap: () => state.onNextPressed(), title: "Next")
          ],
        ),
      ),
    );
  }
}
