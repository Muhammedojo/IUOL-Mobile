import 'dart:math';
import '../core/core.dart';
import '../screen_views/payment_view.dart';

class Payment extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Payment({Key? key}) : super(key: key);

  @override
  PaymentController createState() => PaymentController();
}

class PaymentController extends State<Payment> {
  //... //Initialization code, state vars etc, all go here
  final String amount = "1000";
  final String txRef = "unique_transaction_ref_${Random().nextInt(100000)}";

  String selectedValue = "";
  final TextEditingController dropdownController = TextEditingController();

  setSelectedValue(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  @override
  void initState() {
    _loadDotEnv();
    context.read<PaymentTypeCubit>().loadPaymentTypeFromServer();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PaymentView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  void _loadDotEnv() async {
    await dotenv.load(fileName: ".env");
  }
}
