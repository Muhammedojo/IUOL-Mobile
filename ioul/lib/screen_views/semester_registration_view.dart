import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:ioul/bloc/bloc.dart';
import 'package:ioul/packages/package.dart';
import '../components/components.dart';
import '../components/custom_dropdown_widget.dart';
import '../screens_controllers/semester_registration_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class SemesterRegistrationView extends StatelessView<SemesterRegistration,
    SemesterRegistrationController> {
  const SemesterRegistrationView(SemesterRegistrationController state,
      {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Semester Registration'),
        ),
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return SingleChildScrollView(
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
                  text: "Programme level",
                  style: Styles.x16dp_202325_400w(),
                ),
              ],
            ),
            SizedBox(height: 10.w),
            TextFieldWidget(
              hint: "100",
              onValidate: ValidationBuilder().required().build(),
              controller: state.levelController,
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Semester",
                  style: Styles.x16dp_202325_400w(),
                ),
              ],
            ),
            SizedBox(height: 10.w),
            TextFieldWidget(
              hint: "Rain Semester",
              onValidate: ValidationBuilder().required().build(),
              controller: state.semesterController,
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Study Center",
                  style: Styles.x16dp_202325_400w(),
                ),
              ],
            ),
            SizedBox(height: 10.w),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child:
                    BlocBuilder<SemesterFormDataCubit, SemesterFormDataState>(
                  builder: (context, applicationState) {
                    if (applicationState is SemesterFormDataLoaded) {
                      return CustomDropdownWidget(
                        dropdownList:
                            // applicationState.formData.maritalStatuses ??
                            const ['IOUL Center', 'Others'],
                        controller: state.studyCenterController,
                        onChange: (value) => state.setSelectedValue(value),
                      );
                    }
                    return CustomDropdownWidget(
                      dropdownList: const ['IOUL Center', 'Others'],
                      controller: state.studyCenterController,
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
                  text: "State",
                  style: Styles.x16dp_202325_400w(),
                ),
              ],
            ),
            SizedBox(height: 10.w),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child:
                    BlocBuilder<SemesterFormDataCubit, SemesterFormDataState>(
                  builder: (context, applicationState) {
                    if (applicationState is SemesterFormDataLoaded) {
                      return CustomDropdownWidget(
                        dropdownList:
                            // applicationState.formData.maritalStatuses ??
                            const ['Kaduna', 'Kano'],
                        controller: state.stateController,
                        onChange: (value) => state.setSelectedValue(value),
                      );
                    }
                    return CustomDropdownWidget(
                      dropdownList: const ['Kano', 'Oyo'],
                      controller: state.stateController,
                      onChange: (value) => state.setSelectedValue(value),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 28.h,
            ),
            state.selectedStudyCenter == "Others"
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Address",
                            style: Styles.x16dp_202325_400w(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.w),
                      TextFieldWidget(
                        hint: "Center Address",
                        onValidate: ValidationBuilder().required().build(),
                        controller: state.addressController,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
