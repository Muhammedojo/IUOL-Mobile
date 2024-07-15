import 'package:flutter/cupertino.dart';

import '../../../../core/core.dart';
import '../view/admission_payment_invoice_view.dart';
import '../../../../screens/screens.dart';

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
    context
        .read<ApplicationPaymentCubit>()
        .loadApplicationPaymentLinkFromServer();
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

  goToApplicationConfirmation() {
    Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
            builder: (BuildContext context) =>
                const ApplicationConfirmation()));
  }

  refresh() {
    if (mounted) {
      context
          .read<ApplicationPaymentCubit>()
          .loadApplicationPaymentLinkFromServer();
    }
  }
}
