import 'package:ioul/core/api/provider/provider.dart';
import 'package:ioul/core/api/provider/shared_prefrence.dart';
import '../screen_views/Login_view.dart';
import '../core/core.dart';

class LoginScreen extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginController createState() => LoginController();
}

class LoginController extends State<LoginScreen> {
  //... //Initialization code, state vars etc, all go here

  final repository = AppRepository();
  String deviceToken = "";
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool visible = true;

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
  Widget build(BuildContext context) => LoginView(this);

  //Control logic grouped together, at top of file
  void onBackPressed() {
    NavigatorHelper(context).closeScreen();
  }

  bool isStrongPassword(String password) {
    // Regular expression for a strong password (at least 8 characters with a mix of uppercase, lowercase, and numbers)
    final passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  void onPressLoginButton() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (!WidgetHelper().isValidEmail(email)) {
      WidgetHelper.showToastError(context, "invalid_email");
      return;
    }

    loginUser(email, password);
  }

  void loginUser(String username, String password) async {
    try {
      WidgetHelper.showProgress(text: 'checking'.tr());
      var loginResponse =
          await repository.login(username, password, deviceToken);
      WidgetHelper.hideProgress();
      if (!mounted) return;
      if (loginResponse.isConnectionSuccessful()) {
        AppPrefs().saveTokenToPrefs(loginResponse);
        loginResponse.user!.hasApplication == false
            ? context.goNamed(RouteConstants.admissionPayment)
            : (loginResponse.user!.isAdmitted == false
                ? context.goNamed(RouteConstants.pendingApplication)
                : context.goNamed(RouteConstants.dashboard,
                    extra: loginResponse.user));
      } else {
        WidgetHelper.showToastError(context, ('${loginResponse.message}'));
        return;
      }
    } catch (e) {
      WidgetHelper.hideProgress();
    }
  }
}
