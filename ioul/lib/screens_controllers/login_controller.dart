import 'dart:developer';

import 'package:ioul/bloc/register/cubit.dart';
import 'package:ioul/provider/dio_client.dart';
import 'package:ioul/provider/provider.dart';

import '../helpers/helper.dart';
import '../model/login.dart';
import '../provider/shared_prefrence.dart';
import '../router/route_constants.dart';
import '../screen_views/Login_view.dart';
import '../packages/package.dart';

class Login extends StatefulWidget {
  // static const routeName = Strings.SCREEN_BLANK;

  const Login({Key? key}) : super(key: key);

  @override
  LoginController createState() => LoginController();
}

class LoginController extends State<Login> {
  //... //Initialization code, state vars etc, all go here

  final repository = AppRepository();
  String deviceToken = "";
  final TextEditingController emailController =
      TextEditingController(text: "sam@mailinator.com");
  final TextEditingController passwordController =
      TextEditingController(text: "#Killerbean1");
  bool visible = false;

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

  bool isValidEmail(String email) {
    // Regular expression for a valid email address
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
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

    if (email.isEmpty) {
      WidgetHelper.showToastError(context, "Email is required");
      return;
    } else if (!isValidEmail(email)) {
      WidgetHelper.showToastError(context, "Invalid email address");
      return;
    }

    if (password.isEmpty) {
      WidgetHelper.showToastError(context, "Password is required");
      return;
    } else if (!isStrongPassword(password)) {
      WidgetHelper.showToastError(context,
          "Weak password. Use at least 8 characters with a mix of uppercase, lowercase, and numbers.");
      return;
    }
    loginUser(email, password);
  }

  void loginUser(String username, String password) async {
    LoginData data = LoginData();
    data.email = emailController.text;
    data.password = passwordController.text;
    context.read<RegisterCubit>().pushLoginToServer(data);
  }

  void onLoginSuccess(LoginData data) {
    WidgetHelper.hideProgress();
    AppPrefs().saveTokenToPrefs(data);
    data.user!.hasApplication == false
        ? NavigatorHelper(context)
            .pushNamedScreen(RouteConstants.admissionPayment)
        : NavigatorHelper(context).goNamedScreen(RouteConstants.dashboard);
    DioClient().setToken(data.token ?? "");
  }

  void onLoginFailure(String message) {
    WidgetHelper.hideProgress();
    WidgetHelper.showToastError(context, (message));
  }
}
