
import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../screen_views/admission_payment.dart';

class AdmissionPayment extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const AdmissionPayment({Key? key}) : super(key: key);

  @override
  AdmissionPaymentController createState() => AdmissionPaymentController();
}

class AdmissionPaymentController extends State<AdmissionPayment> {
  //... //Initialization code, state vars etc, all go here

  String selectedValue = "";
  final TextEditingController dropdownController = TextEditingController();

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initializeFlutterWave(){
    
  }

  @override
  Widget build(BuildContext context) => AdmissionPaymentView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
