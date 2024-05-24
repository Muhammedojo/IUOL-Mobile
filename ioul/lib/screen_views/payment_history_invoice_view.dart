import '../components/components.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/payment_history_invoice_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class PaymentHistoryInvoiceView extends StatelessView<PaymentHistoryInvoice,
    PaymentHistoryInvoiceController> {
  const PaymentHistoryInvoiceView(PaymentHistoryInvoiceController state,
      {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundWhite,
      body: WidgetWrapper(child: _body(context)),
      appBar: WidgetHelper().appBackArrowWithTitle(context,
          title: 'payment_invoice'.tr(), onTap: () => state.onBackPressed()),
    );
  }

  Widget _body(context) {
    double amount = double.parse('${widget.paymentHistory?.amount}');
    String formattedAmount =
        NumberFormat.currency(symbol: "₦", decimalDigits: 2).format(amount);
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
      child: Column(
        children: [
          Screenshot(
            controller: state.screenshotController,
            child: RepaintBoundary(
              key: state.downloadGlobalKey,
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/iconic_logo.png",
                        // fit: BoxFit.contain,
                        height: 120.h,
                        width: 174.w,
                      ),
                    ),
                    SizedBox(height: 36.h),
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Transaction ID:',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: Styles.font,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000))),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: Text(
                                '${widget.paymentHistory?.transactionId}',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: Styles.font,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff000000))),
                          ),
                          SvgPicture.asset('assets/images/success_pay.svg')
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xff000000),
                    ),
                    Padding(
                      padding:
                          REdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                      child: Row(
                        children: [
                          Text('Name:',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: Styles.font,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000))),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: Text('${widget.paymentHistory?.name}',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: Styles.font,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff000000))),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xff000000),
                    ),
                    Padding(
                      padding:
                          REdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                      child: Row(
                        children: [
                          Text('Admission Number:',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: Styles.font,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000))),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: Text(
                                '${widget.paymentHistory?.admissionNumber}',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: Styles.font,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff000000))),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xff000000),
                    ),
                    Padding(
                      padding:
                          REdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                      child: Row(
                        children: [
                          Text('Product/Service:',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: Styles.font,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000))),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: Text('${widget.paymentHistory?.paymentType}',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: Styles.font,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff000000))),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xff000000),
                    ),
                    Padding(
                      padding:
                          REdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
                      child: Row(
                        children: [
                          Text('Amount:',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: Styles.font,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff000000))),
                          SizedBox(
                            width: 20.w,
                          ),
                          Expanded(
                            child: Text(formattedAmount,
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: Styles.font,
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xff000000))),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xff000000),
                    ),
                    SizedBox(
                      height: 80.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButtonWidget(
              onTap: () {
                state.downloadReceipt(context);
              },
              title: 'download_invoice'.tr())
        ],
      ),
    );
  }
}
