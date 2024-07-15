import '../../../../components/components.dart';
import '../../../../core/core.dart';
import '../../../../screens/screens.dart';
import '../controller/admission_payment_invoice_controller.dart';
import '../../../../core/utils/mvc.dart';

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
                    fontFamily: Styles.font,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff000000))),
          ),
          SizedBox(
            height: 40.h,
          ),
          Padding(
            padding: REdgeInsets.symmetric(vertical: 18.0, horizontal: 10),
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
                  child: BlocBuilder<UserCubit, UserState>(
                      builder: (context, stateBloc) {
                    if (stateBloc is UserLoaded) {
                      return Text(
                        stateBloc.login.fullName() ?? '',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: Styles.font,
                            color: const Color(0xff000000)),
                      );
                    }
                    return Text(
                      '',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: Styles.font,
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
                        fontFamily: Styles.font,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff000000))),
                SizedBox(
                  width: 20.w,
                ),
                Expanded(
                  child: BlocBuilder<ApplicationPaymentCubit,
                      ApplicationPaymentState>(builder: (context, stateBloc) {
                    if (stateBloc is ApplicationPaymentLoading) {
                      const Loader();
                    } else if (stateBloc is ApplicationPaymentLoaded) {
                      Map<String, dynamic> payment =
                          stateBloc.paymentLink.datas;
                      return payment.isNotEmpty
                          ? Text(
                              payment["description"],
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Styles.font,
                                  color: const Color(0xff000000)),
                            )
                          : Text(
                              '',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Styles.font,
                                  color: const Color(0xff000000)),
                            );
                    }
                    return Text(
                      '',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: Styles.font,
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
                  child: BlocBuilder<ApplicationPaymentCubit,
                      ApplicationPaymentState>(builder: (context, stateBloc) {
                    if (stateBloc is ApplicationPaymentLoaded) {
                      Map<String, dynamic> payment =
                          stateBloc.paymentLink.datas;
                      final NumberFormat currencyFormatter =
                          NumberFormat.currency(symbol: '₦');

                      final amount = payment["amount"];
                      final numericAmount =
                          amount is String ? int.parse(amount) : amount;

                      return payment.isNotEmpty
                          ? Text(
                              currencyFormatter.format(numericAmount),
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Styles.font,
                                  color: const Color(0xff000000)),
                            )
                          : Text(
                              '',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: Styles.font,
                                  color: const Color(0xff000000)),
                            );
                    }
                    return Text(
                      '',
                      style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: Styles.font,
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
          SizedBox(
            height: 80.h,
          ),
          BlocBuilder<ApplicationPaymentCubit, ApplicationPaymentState>(
              builder: (context, stateBloc) {
            if (stateBloc is ApplicationPaymentLoaded) {
              Map<String, dynamic> payment = stateBloc.paymentLink.datas;
              var link = payment["payment_url"];
              return payment.isNotEmpty
                  ? ElevatedButtonWidget(
                      onTap: () {
                        if (link != null) {
                          WidgetHelper().launchURL(link);
                        }
                        state.goToApplicationConfirmation();
                      },
                      title: 'proceed'.tr())
                  : const SizedBox();
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }
}
