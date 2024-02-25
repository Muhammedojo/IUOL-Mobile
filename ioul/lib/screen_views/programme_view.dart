import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ioul/values/styles.dart';
import '../bloc/bloc.dart';
import '../components/components.dart';
import '../components/custom_dropdown_widget.dart';
import '../packages/package.dart';
import '../screens_controllers/programme_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class ProgrammeView extends StatelessView<Programme, ProgrammeController> {
  const ProgrammeView(ProgrammeController state, {Key? key})
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
                    text: "Programme Applied for",
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
                              applicationState.formData.programmes ?? [],
                          controller: state.programController,
                          onChange: (value) => state.setSelectedValue(value),
                        );
                      }
                      return CustomDropdownWidget(
                        dropdownList: const [],
                        controller: state.programController,
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
                  child: CustomDropdownWidget(
                    dropdownList: const [
                      'Islam',
                      'Christianity',
                      'Traditionalist',
                    ],
                    controller: state.highestQualificationController,
                    onChange: (value) => state.setSelectedValue(value),
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
                  child: CustomDropdownWidget(
                    dropdownList: const [
                      'Islam',
                      'Christianity',
                      'Traditionalist',
                    ],
                    controller: state.qualificationController,
                    onChange: (value) => state.setSelectedValue(value),
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
                      'Islam',
                      'Christianity',
                      'Traditionalist',
                    ],
                    controller: state.levelController,
                    onChange: (value) => state.setSelectedValue(value),
                  ),
                ),
              ),
              SizedBox(height: 230.h),
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
                        onTap: () => state.validateProgramInfo(),
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
