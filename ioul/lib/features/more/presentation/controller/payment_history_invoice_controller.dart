import '../../../../core/core.dart';
import '../view/payment_history_invoice_view.dart';

class PaymentHistoryInvoice extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;
  final PaymentsHistory? paymentHistory;

  const PaymentHistoryInvoice({Key? key, this.paymentHistory})
      : super(key: key);

  @override
  PaymentHistoryInvoiceController createState() =>
      PaymentHistoryInvoiceController();
}

class PaymentHistoryInvoiceController extends State<PaymentHistoryInvoice> {
  //... //Initialization code, state vars etc, all go here

  final GlobalKey downloadGlobalKey = GlobalKey();
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PaymentHistoryInvoiceView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  Future<void> downloadReceipt(context) async {
    try {
      final image = await screenshotController.capture(pixelRatio: 2.0);
      if (image != null) {
        // ignore: unused_local_variable
        final result = await ImageGallerySaver.saveImage(
          image,
          quality: 100,
          name: "receipt",
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Receipt saved to gallery!')),
        );
      }
      // ignore: empty_catches
    } catch (e) {}
  }
}
