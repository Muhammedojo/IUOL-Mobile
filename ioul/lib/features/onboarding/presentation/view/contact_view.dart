import 'package:form_validator/form_validator.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../core/core.dart';
import '../../../../components/components.dart';
import '../controller/contact_controller.dart';
import '../../../../screen_views/stateless_view.dart';

class ContactView extends StatelessView<Contact, ContactController> {
  const ContactView(ContactController state, {Key? key})
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
        // padding: MediaQuery.of(context).viewInsets,
        child: Form(
          key: state.formKey,
          child: Column(
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
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButtonWidget(
                        onTap: () => state.onReversePressed(),
                        title: "back".tr()),
                  ),
                  SizedBox(width: 132.w),
                  Expanded(
                    flex: 1,
                    child: ElevatedButtonWidget(
                        onTap: () => state.validateContactInfo(),
                        title: "next".tr()),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
