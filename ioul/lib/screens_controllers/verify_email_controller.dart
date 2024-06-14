import '../core/core.dart';
import '../core/api/provider/repository.dart';
import '../screen_views/verify_email_view.dart';

class VerifyEmail extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const VerifyEmail({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  VerifyEmailController createState() => VerifyEmailController();
}

class VerifyEmailController extends State<VerifyEmail> {
  //... //Initialization code, state vars etc, all go here

  final repository = AppRepository();
  TextEditingController pinputController = TextEditingController();

  bool visible = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  toggleVisibility() {
    setState(() {
      visible = !visible;
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

  @override
  Widget build(BuildContext context) => VerifyEmailView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  verifyPin() async {
    var pin = pinputController.text.trim();
    var email = widget.email;

    if (pin.isEmpty) {
      WidgetHelper.showToastError(context, "kindly_provide_your_pin".tr());
      return;
    } else if (pin.length < 4) {
      WidgetHelper.showToastError(context, "incomplete_pin".tr());
      return;
    }
    sendPinToServer(pin, email);
  }

  void sendPinToServer(String pin, String email) async {
    final EmailVerification data = EmailVerification();
    data.email = email;
    data.pin = pin;
    context.read<VerifyEmailCubit>().pushPinToServer(data);
  }

  void resendEmailVerification(String email) async {
    final ResendEmailVerification data = ResendEmailVerification();
    data.email = widget.email;
    context.read<ResendEmailVerificationCubit>().resendPin(data);
  }
}
