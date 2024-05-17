import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutterwave_standard/flutterwave.dart';
import 'package:ioul/bloc/get_application_form/get_application_form_cubit.dart';
import 'package:ioul/bloc/make_payment/make_payment_cubit.dart';
import 'package:ioul/model/make_payment.dart';
import 'package:ioul/model/model.dart';
import 'package:uuid/uuid.dart';

import '../helpers/navigator_helper.dart';
import '../packages/package.dart';
import '../provider/api_provider.dart';
import '../provider/endpoints.dart';
import '../screen_views/admission_payment_invoice.dart';
import '../utils/global_variables.dart';
import '../values/colors.dart';

class AdmissionPaymentInvoice extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const AdmissionPaymentInvoice({Key? key}) : super(key: key);

  @override
  AdmissionPaymentInvoiceController createState() =>
      AdmissionPaymentInvoiceController();
}

class AdmissionPaymentInvoiceController extends State<AdmissionPaymentInvoice> {
  //... //Initialization code, state vars etc, all go here

  @override
  void initState() {
    super.initState();
    onGetApplicationFormData();
    transactionRef = const Uuid().v1();
  }

  String transactionRef = "";

  onGetApplicationFormData() {
    context.read<GetApplicationFormCubit>().getApplicationFormData();
  }

  ApplicationFormData applicationData = ApplicationFormData();

  getApplicationDetail(ApplicationFormData data) {
    applicationData = data;
  }

  onProceedToPayment() async {
    final Customer customer = Customer(
      email: applicationData.user?.email ?? "",
      name: applicationData.user?.name ?? "",
      phoneNumber: applicationData.user?.phone ?? "",
    );

    final Flutterwave flutterwave = Flutterwave(
        context: context,
        publicKey: flutterWavePublicKey,
        currency: "NGN",
        redirectUrl: redirectUrl,
        txRef: transactionRef,
        amount: applicationData.amount.toString(),
        customer: customer,
        paymentOptions: "card, payattitude, barter, bank transfer, ussd",
        customization: Customization(title: "IOUL Admission Payment"),
        isTestMode: kDebugMode);
    final ChargeResponse response = await flutterwave.charge();
    showLoading(response);
    if (response.status?.toLowerCase() == "successful") {
      ApplicationFormData formData = ApplicationFormData()
        ..amount = applicationData.amount
        ..description = applicationData.description
        ..paymentType = applicationData.paymentType;
      MakePaymentData data = MakePaymentData()
        ..applicationData = formData
        ..transactionId = transactionRef
        ..referenceId = response.transactionId
        ..status = response.status;
      // ApiProvider().makePayment(pin: "pin");
      if (context.mounted) {
        context.read<MakePaymentCubit>().makePayment(data);
      }
    }
    log("${response.toJson()}");
  }

  Future<void> showLoading(ChargeResponse message) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundWhite,
          content: Container(
            margin: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            width: double.infinity,
            height: 50,
            child: message.success!
                ? Text(
                    "Payment successful",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.inkDarker,
                    ),
                  )
                : Text(
                    "Sorry we couldn't complete your payment",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.inkDarker,
                    ),
                  ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AdmissionPaymentInvoiceView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }
}
