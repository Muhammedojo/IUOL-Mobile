import 'package:form_validator/form_validator.dart';
import '../../../../components/components.dart';
import '../../../../components/custom_dropdown_widget.dart';
import '../../../../core/core.dart';
import '../controller/certificate_controller.dart';
import '../../../../screen_views/stateless_view.dart';

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
                  child: BlocBuilder<ApplicationFormDataCubit,
                      ApplicationFormDataState>(
                    builder: (context, applicationState) {
                      if (applicationState is ApplicationFormDataLoaded) {
                        return CustomDropdownWidget(
                          dropdownList:
                              applicationState.formData.certificates ?? [],
                          controller: state.certificateTypeController,
                          onChange: (value) => state.setSelectedValue(value),
                        );
                      }
                      return CustomDropdownWidget(
                        dropdownList: const [
                          'SSCE',
                          'NCE',
                          'OND',
                          'ND',
                          'Bachelor'
                        ],
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
              SizedBox(height: 28.h),
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
                        onTap: () => state.validateCertificateInfo(),
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
