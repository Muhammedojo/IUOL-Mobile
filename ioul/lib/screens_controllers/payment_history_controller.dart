import '../screen_views/payment_history_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class PaymentHistory extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const PaymentHistory({Key? key}) : super(key: key);

  @override
  PaymentHistoryController createState() => PaymentHistoryController();
}

class PaymentHistoryController extends State<PaymentHistory> {

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
  Widget build(BuildContext context) => PaymentHistoryView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}