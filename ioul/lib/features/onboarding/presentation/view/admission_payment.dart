import '../../../../core/core.dart';
import '../../../../components/components.dart';
import '../../../../components/custom_dropdown_widget.dart';
import '../../../../screens_controllers/admission_payment.dart';
import '../../../../screen_views/stateless_view.dart';

class AdmissionPaymentView
    extends StatelessView<AdmissionPayment, AdmissionPaymentController> {
  const AdmissionPaymentView(AdmissionPaymentController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundWhite,
      appBar: AppBar(),
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
                    text: "admission_process_payment".tr(),
                    style: Styles.x16dp_000000_400w(),
                  ),
                  SizedBox(height: 72.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextWidget(
                        text: "payment_method".tr(),
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
                    title: "proceed".tr(),
                    onTap: () => state.selectedValue == "Scratch Card"
                        ? NavigatorHelper(context)
                            .pushNamedScreen(RouteConstants.scratchCard)
                        : NavigatorHelper(context).pushNamedScreen(
                            RouteConstants.applicationConfirmation),
                    // NavigatorHelper(context).pushNamedScreen(
                    //     RouteConstants.admissionPaymentInvoice),
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
