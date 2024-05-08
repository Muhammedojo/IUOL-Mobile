import 'package:ioul/packages/package.dart';

import '../bloc/bloc.dart';
import '../screen_views/admission_payment_invoice_view.dart';
import 'package:flutter/material.dart';
import '../helpers/helper.dart';

class AdmissionPaymentInvoice extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const AdmissionPaymentInvoice({Key? key}) : super(key: key);

  @override
  AdmissionPaymentInvoiceController createState() =>
      AdmissionPaymentInvoiceController();
}

class AdmissionPaymentInvoiceController extends State<AdmissionPaymentInvoice> {
  //... //Initialization code, state vars etc, all go here
  late final UserCubit userCubit;

  @override
  void initState() {
    userCubit = context.read<UserCubit>();
    userCubit.loadUser();
    super.initState();
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
