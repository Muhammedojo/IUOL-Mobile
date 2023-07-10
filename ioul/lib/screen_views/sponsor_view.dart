import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ioul/helpers/widget_helper.dart';
import 'package:ioul/values/styles.dart';
import '../components/components.dart';
import '../components/custom_dropdown_widget.dart';
import '../components/elevated_button_widget.dart';
import '../components/text_widget.dart';
import '../components/textfield_widget.dart';
import '../screens_controllers/application_form_controller.dart';
import '../screens_controllers/sponsor_view.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class SponsorView extends StatelessView<Sponsor, SponsorController> {
  const SponsorView(SponsorController state, {Key? key})
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Sponsor",
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
                  controller: state.firstNameController,
                  onChange: (value) => state.setSelectedValue(value),
                ),
              ),
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Sponsor Name",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            TextfieldWidget(
              hint: "Name",
              controller: state.surnameController,
            ),
            SizedBox(height: 28.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Sponsor Address",
                  style: Styles.x16dp_202325_400w(),
                ),
                SizedBox(width: 10.w),
                SvgPicture.asset("assets/images/red_star.svg"),
              ],
            ),
            SizedBox(height: 10.w),
            TextfieldWidget(
              hint: "Address",
              controller: state.surnameController,
            ),
            SizedBox(height: 320.h),
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
                      onTap: () => state.onNextPressed(), title: "Next"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
