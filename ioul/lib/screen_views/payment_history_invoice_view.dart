import 'package:flutter/material.dart';
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
      body: WidgetWrapper(child: _body()),
      appBar: WidgetHelper()
          .appBackArrowWithTitle(context, title: 'Payment Invoice'),
    );
  }

  Widget _body() {
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text('Iconic University of Opening Learning',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff000000))),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transaction ID:',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff000000))),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Text('#38741084',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
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
            padding: REdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
            child: Row(
              children: [
                Text('Name:',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff000000))),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Text('Sulaiman Ademola Idris',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000))),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xff000000),
          ),
          Padding(
            padding: REdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
            child: Row(
              children: [
                Text('Admission Number:',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff000000))),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Text('1610600109',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000))),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xff000000),
          ),
          Padding(
            padding: REdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
            child: Row(
              children: [
                Text('Product/Service:',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff000000))),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Text('Tuition Fee for Spring Semester (2021/2023)',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff000000))),
                ),
              ],
            ),
          ),
          const Divider(
            color: Color(0xff000000),
          ),
          Padding(
            padding: REdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
            child: Row(
              children: [
                Text('Amount:',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff000000))),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: Text('N50,000.00',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
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
          ElevatedButtonWidget(onTap: () {}, title: 'Download Invoice')
        ],
      ),
    );
  }
}
