import '../screen_views/payment_history_invoice_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class PaymentHistoryInvoice extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const PaymentHistoryInvoice({Key? key}) : super(key: key);

  @override
  PaymentHistoryInvoiceController createState() => PaymentHistoryInvoiceController();
}

class PaymentHistoryInvoiceController extends State<PaymentHistoryInvoice> {

  //... //Initialization code, state vars etc, all go here

  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PaymentHistoryInvoiceView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}