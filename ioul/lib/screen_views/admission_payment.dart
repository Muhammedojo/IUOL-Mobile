import 'package:ioul/screen_views/payment.dart';
import 'package:ioul/screens_controllers/payment_controller.dart';

import '../helpers/helper.dart';
import '../packages/package.dart';
import 'package:ioul/router/route_constants.dart';
import '../components/components.dart';
import '../components/custom_dropdown_widget.dart';
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
                      child: CustomDropdownWidget(
                        dropdownList: const [
                          'Online Payment (Cards Payment)',
                          'Scratch Card',
                        ],
                        controller: state.dropdownController,
                        onChange: (value) => state.setSelectedValue(value),
                      ),
                    ),
                  ),
                  SizedBox(height: 51.h),
                  ElevatedButtonWidget(
                    title: "Proceed",
                    onTap: () => state.selectedValue == "Scratch Card"
                        ? NavigatorHelper(context)
                            .pushNamedScreen(RouteConstants.scratchCard)
                        :
                        //  Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             const Payments("Online payment")),
                        //   )

                        NavigatorHelper(context).pushNamedScreen(
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
