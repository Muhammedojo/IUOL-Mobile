import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../controller/controller.dart';

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
                    SizedBox(height: 30.h),
                    Padding(
                      padding: REdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          'Transaction ID:'.toText(
                            color: AppColors.inkDarkerDark,
                            fontSize: 16,
                          ),
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
                          REdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      child: Row(
                        children: [
                          'Name:'.toText(
                            color: AppColors.inkDarkerDark,
                            fontSize: 16,
                          ),
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
                          REdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      child: Row(
                        children: [
                          'Admission Number:'.toText(
                            color: AppColors.inkDarkerDark,
                            fontSize: 16,
                          ),
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
                          REdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      child: Row(
                        children: [
                          'Product/Service:'.toText(
                            color: AppColors.inkDarkerDark,
                            fontSize: 16,
                          ),
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
                          REdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                      child: Row(
                        children: [
                          'Amount:'.toText(
                            color: AppColors.inkDarkerDark,
                            fontSize: 16,
                          ),
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
                      height: 75.h,
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
