import '../../../../core/core.dart';
import '../../../../core/api/provider/provider.dart';

import '../bloc/bloc.dart';
import '../view/code_input_view.dart';

class CodeInput extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const CodeInput({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  CodeInputController createState() => CodeInputController();
}

class CodeInputController extends State<CodeInput> {
  //... //Initialization code, state vars etc, all go here
  final repository = AppRepository();
  TextEditingController pinputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CodeInputView(this);

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
    final ResendEmailVerification detail = ResendEmailVerification();
    detail.email = widget.email;
    context.read<ResendEmailVerificationCubit>().resendPin(detail);
  }
}
