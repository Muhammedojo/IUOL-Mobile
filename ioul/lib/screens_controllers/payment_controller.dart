import '../screen_views/payment_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';
import '../values/values.dart';

class Payment extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Payment({Key? key}) : super(key: key);

  @override
  PaymentController createState() => PaymentController();
}

class PaymentController extends State<Payment> {

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
  Widget build(BuildContext context) => PaymentView(this);

  //Control logic grouped together, at top of file
  void onBackPressed(){
    NavigatorHelper(context).closeScreen();
  }

}