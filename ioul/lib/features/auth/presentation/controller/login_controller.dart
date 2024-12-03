import 'package:ioul/core/api/provider/provider.dart';
import '../../../../core/core.dart';
import '../bloc/bloc.dart';
import '../view/login_view.dart';

class LoginScreen extends StatefulWidget {
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
    final passwordRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return passwordRegex.hasMatch(password);
  }

  void onPressLoginButton() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (!WidgetHelper().isValidEmail(email)) {
      WidgetHelper.showToastError(context, "invalid_email".tr());
      return;
    }
    if (password.isEmpty) {
      WidgetHelper.showToastError(context, "invalid_password".tr());
      return;
    }

    loginUser(email, password);
  }

  void loginUser(String username, String password) async {
    final Login data = Login();
    data.username = username;
    data.password = password;
    context.read<LoginCubit>().loginUser(data);
  }
}
