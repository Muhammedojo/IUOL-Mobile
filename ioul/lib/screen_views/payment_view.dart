
import '../components/custom_dropdown_widget.dart';
import '../core/core.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/payment_controller.dart';
import 'payment.dart';
import 'stateless_view.dart';

class PaymentView extends StatelessView<Payment, PaymentController> {
  const PaymentView(PaymentController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        //AppColors.backgroundWhite,
        appBar: WidgetHelper().appBackArrowWithTitle(context,
            title: 'payment'.tr(), onTap: () => state.onBackPressed()),
        body: WidgetWrapper(child: _body(context)));
  }

  Widget _body(context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 13.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "Select Payment Type:",
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
                    child: BlocBuilder<PaymentTypeCubit, PaymentTypeState>(
                      builder: (context, applicationState) {
                        if (applicationState is PaymentTypeLoaded) {
                          //final data = applicationState.paymentType.data;
                          // print('Payment data: $data');

                          // List<String> dropdownList = ['ok'];
                          // if (data != null && data is Map<String, String>) {
                          //   print('Payment data length: ${data.length}');
                          //   dropdownList = data.values.cast<String>().toList();
                          //   print('Dropdown List: $dropdownList');
                          // } else {
                          //   print('Data is null or not a Map<String, String>');
                          // }

                          return CustomDropdownWidget(
                            dropdownList: const [
                              'Application Form Fee',
                              'Semester Registration Fee',
                              'Late Registration Fee',
                              'Transcript',
                              "Test Extention",
                              'Assignment Extention'
                            ],
                            controller: state.dropdownController,
                            onChange: (value) => state.setSelectedValue(value),
                          );
                        }

                        // Default dropdown items
                        return CustomDropdownWidget(
                          dropdownList: const [
                            'Application Form Fee',
                            'Semester Registration Fee',
                            'Late Registration Fee',
                            'Transcript',
                            "Test Extention",
                            'Assignment Extention'
                          ],
                          controller: state.dropdownController,
                          onChange: (value) => state.setSelectedValue(value),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Center(
                    child: Text(
                  state.selectedValue.isEmpty
                      ? ''
                      : '${state.selectedValue} Payment',
                  style: Styles.x16dp_202325_400w(),
                )),
                SizedBox(height: 90.h),
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 20.0),
                  child: SubmitButtonWidget(
                    label: 'proceed_to_payment'.tr(),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Payments(state.selectedValue)),
                      );
                    },
                    color: state.selectedValue.isEmpty
                        ? Colors.grey
                        : const Color(0xff25435B),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
