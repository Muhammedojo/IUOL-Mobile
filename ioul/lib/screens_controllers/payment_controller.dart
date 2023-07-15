import 'dart:math';
import '../packages/package.dart';
import '../screen_views/payment_view.dart';
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
  final String amount = "1000";
  final String txRef = "unique_transaction_ref_${Random().nextInt(100000)}";


  @override
  void initState(){
    _loadDotEnv();
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

  void _loadDotEnv () async{
    await dotenv.load(fileName: ".env");
  }

  void makePayment() async {
    final style = FlutterwaveStyle(
        appBarText: "Pay with Flutterwave",
        buttonColor: Colors.orangeAccent,
        appBarIcon: const Icon(Icons.payment_rounded, color: Colors.black),
        buttonTextStyle: TextStyle(
          color: Colors.black,
          fontFamily: 'Inter',
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
        appBarColor: Colors.orange,
        dialogCancelTextStyle: TextStyle(
          color: Colors.redAccent,
          fontFamily: 'Inter',
          fontSize: 18.sp,
        ),
        dialogContinueTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 18.sp,
          fontFamily: 'Inter',
        )
    );

    final Customer customer = Customer(
        name: "FLW Customer",
        phoneNumber: "12345678910",
        email: "flwcustomer@qa.team");

    final Flutterwave flutterwave = Flutterwave(
        context: context,
        style: style,
        publicKey: dotenv.env['PUBLIC_KEY']!,
        currency: "NGN",
        txRef: txRef,
        amount: amount,
        customer: customer,
        paymentOptions: "ussd, card, barter, payattitude",
        customization: Customization(title: "Test Payment"),
        isTestMode: true,
        redirectUrl: '');

    final ChargeResponse response = await flutterwave.charge();
    if (response != null) {
      print(response.toJson());
      if (response.success! && response.txRef == txRef) {
       const Text('Hurray');
      } else {
        const Text('Opps');
      }
    } else {
      const Text('Opps');
    }
  }


}