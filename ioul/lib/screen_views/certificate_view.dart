import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:ioul/values/styles.dart';
import '../components/components.dart';
import '../components/custom_dropdown_widget.dart';
import '../screens_controllers/certificate_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class CertificateView
    extends StatelessView<Certificate, CertificateController> {
  const CertificateView(CertificateController state, {Key? key})
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
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Type of Certificate",
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
                    controller: state.certificateTypeController,
                    onChange: (value) => state.setSelectedValue(value),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Exam Center Name",
                    style: Styles.x16dp_202325_400w(),
                  ),
                  SizedBox(width: 10.w),
                  SvgPicture.asset("assets/images/red_star.svg"),
                ],
              ),
              SizedBox(height: 10.w),
              TextFieldWidget(
                hint: "Center name",
                onValidate: ValidationBuilder().required().build(),
                controller: state.centerNameController,
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Exam Centre Number",
                    style: Styles.x16dp_202325_400w(),
                  ),
                  SizedBox(width: 10.w),
                  SvgPicture.asset("assets/images/red_star.svg"),
                ],
              ),
              SizedBox(height: 10.w),
              TextFieldWidget(
                hint: "Center number",
                onValidate: ValidationBuilder().required().build(),
                controller: state.centerNumberController,
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Candidate Exam Number",
                    style: Styles.x16dp_202325_400w(),
                  ),
                  SizedBox(width: 10.w),
                  SvgPicture.asset("assets/images/red_star.svg"),
                ],
              ),
              SizedBox(height: 10.w),
              TextFieldWidget(
                hint: "Exam number",
                onValidate: ValidationBuilder().required().build(),
                controller: state.examNumberController,
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "Exam Year",
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
                    controller: state.examYearController,
                    onChange: (value) => state.setSelectedValue(value),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: ElevatedButtonWidget(
                        onTap: () => state.onReversePressed(), title: "Back"),
                  ),
                  SizedBox(width: 132.w),
                  Expanded(
                    flex: 1,
                    child: ElevatedButtonWidget(
                        onTap: () => state.validateCertificateInfo(),
                        title: "Next"),
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
