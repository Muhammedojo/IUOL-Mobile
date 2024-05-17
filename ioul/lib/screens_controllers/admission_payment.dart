import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:ioul/packages/package.dart';
import 'package:ioul/provider/provider.dart';
import 'package:ioul/router/router.dart';
import 'package:ioul/utils/utils.dart';
import 'package:ioul/values/values.dart';
import 'package:uuid/uuid.dart';

import '../helpers/helper.dart';
import 'package:flutter/material.dart';
import '../provider/endpoints.dart';
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

  initializeFlutterWave() {}

  onCardPayment() async {
    // final response = await ApiProvider().getApplicationForm();
    // response.fold((l) => log("error: ${l.failureMessage()}"),
    //     (r) => log("success: ${r.data?.user?.name}"));
    context.pushNamed(RouteConstants.admissionPaymentInvoice);
    // final Customer customer = Customer(email: GlobalVariables.userEmail);

    // final Flutterwave flutterwave = Flutterwave(
    //     context: context,
    //     publicKey: flutterWavePublicKey,
    //     currency: "NGN",
    //     redirectUrl: redirectUrl,
    //     txRef: const Uuid().v1(),
    //     amount: "10000",
    //     customer: customer,
    //     paymentOptions: "card, payattitude, barter, bank transfer, ussd",
    //     customization: Customization(title: "IOUL Admission Payment"),
    //     isTestMode: kDebugMode);
    // final ChargeResponse response = await flutterwave.charge();
    // showLoading(response);
    // if (response.status?.toLowerCase() == "successful") {
    //   ApiProvider().makePayment(pin: "pin");
    // }
    // log("${response.toJson()}");
  }

  

  @override
  Widget build(BuildContext context) => AdmissionPaymentView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
