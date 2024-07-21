import 'package:flutter/cupertino.dart';
import '../../../../core/core.dart';
import '../bloc/bloc.dart';
import '../view/payment_history_view.dart';
import 'payment_history_invoice_controller.dart';

class PaymentHistory extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const PaymentHistory({Key? key}) : super(key: key);

  @override
  PaymentHistoryController createState() => PaymentHistoryController();
}

class PaymentHistoryController extends State<PaymentHistory> {
  //... //Initialization code, state vars etc, all go here

  @override
  void initState() {
    context.read<PaymentHistoryCubit>().loadPaymentHistoryFromServer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PaymentHistoryView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  showPaymentDetails(PaymentsHistory paymentHistories) async {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => PaymentHistoryInvoice(
                  paymentHistory: paymentHistories,
                )));
  }

  refresh() {
    if (mounted) {
      context.read<PaymentHistoryCubit>().loadPaymentHistoryFromServer();
    }
  }
}
