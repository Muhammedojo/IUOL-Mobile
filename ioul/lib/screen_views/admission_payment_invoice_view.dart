import '../bloc/user/cubit.dart';
import '../components/components.dart';
import '../helpers/helper.dart';
import '../packages/package.dart';
import '../screens/screens.dart';
import '../screens_controllers/admission_payment_invoice_controller.dart';
import '../values/values.dart';
import 'payment.dart';
import 'stateless_view.dart';

class AdmissionPaymentInvoiceView extends StatelessView<AdmissionPaymentInvoice,
    AdmissionPaymentInvoiceController> {
  const AdmissionPaymentInvoiceView(AdmissionPaymentInvoiceController state,
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
    return Padding(
      padding: REdgeInsets.symmetric(vertical: 30.0, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text('Iconic Open University',
                style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff000000))),
          ),
          SizedBox(
            height: 40.h,
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
                  child: BlocBuilder<UserCubit, UserState>(
                      builder: (context, stateBloc) {
                    if (stateBloc is UserLoaded) {
                      return Text(
                        stateBloc.login.fullName() ?? '',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Inter',
                            color: const Color(0xff000000)),
                      );
                    }
                    return Text(
                      '',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Inter',
                          color: const Color(0xffffffff)),
                    );
                  }),
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
                  child: Text('Application Form Payment',
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
                  child: Text('N10,000.00',
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
          ElevatedButtonWidget(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const Payments("Application Payment")),
                );
              },
              title: 'Continue')
        ],
      ),
    );
  }
}
