import 'package:ioul/packages/package.dart';

import '../bloc/bloc.dart';
import '../screen_views/payment_history_view.dart';

import '../helpers/helper.dart';

class PaymentHistory extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const PaymentHistory({Key? key}) : super(key: key);

  @override
  PaymentHistoryController createState() => PaymentHistoryController();
}

class PaymentHistoryController extends State<PaymentHistory> {
  //... //Initialization code, state vars etc, all go here
  late final PaymentHistoryCubit paymentHistCubit;

  @override
  void initState() {
    super.initState();
    paymentHistCubit = context.read<PaymentHistoryCubit>();
    paymentHistCubit.loadPaymentHistoryFromServer();
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
}
