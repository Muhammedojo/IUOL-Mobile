import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ioul/components/elevated_button_widget.dart';
import 'package:ioul/components/text_widget.dart';
import 'package:ioul/components/textfield_widget.dart';
import 'package:ioul/helpers/helper.dart';
import 'package:ioul/helpers/widget_helper.dart';
import 'package:ioul/packages/package.dart';
import 'package:ioul/router/route_constants.dart';
import 'package:ioul/values/styles.dart';
import '../components/components.dart';
import '../screens_controllers/admission_payment.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class AdmissionPaymentView
    extends StatelessView<AdmissionPayment, AdmissionPaymentController> {
  const AdmissionPaymentView(AdmissionPaymentController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundWhite,
      appBar: WidgetHelper().appBackArrowOnly(context),
      body: WidgetWrapper(
        child: SingleChildScrollView(
          child: SizedBox(
            // padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 60.h),
                  Image.asset(
                    "assets/images/iconic_logo.png",
                    // fit: BoxFit.contain,
                    height: 120.h,
                    width: 174.w,
                  ),
                  SizedBox(height: 36.h),
                  TextWidget(
                    text: "Admission Process Payment",
                    style: Styles.x16dp_000000_400w(),
                  ),
                  SizedBox(height: 72.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: "Payment Method:",
                        style: Styles.x16dp_202325_400w(),
                      ),
                      SizedBox(width: 10.w),
                      SvgPicture.asset("assets/images/red_star.svg"),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CustomDropdown(
                        borderSide: BorderSide(
                          color: AppColors.inkLight,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(8.r),
                        hintText: 'Select',
                        items: const [
                          'Online Payment (Cards Payment)',
                          'Scratch Card',
                        ],
                        controller: state.dropdownController,
                        selectedStyle: Styles.x16dp_72777A_400w(),
                        listItemStyle: Styles.x16dp_000000_400w(),
                        // fieldSuffixIcon: ,
                        onChanged: (value) {
                          state.setSelectedValue(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 51.h),
                  ElevatedButtonWidget(
                    title: "Proceed",
                    onTap: () => state.selectedValue == "Scratch Card"
                        ? NavigatorHelper(context)
                            .pushNamedScreen(RouteConstants.scratchCard)
                        : NavigatorHelper(context).pushNamedScreen(
                            RouteConstants.applicationConfirmation),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
