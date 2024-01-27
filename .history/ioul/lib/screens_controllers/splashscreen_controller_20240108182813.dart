import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ioul/router/router.dart';
import '../screen_views/splashscreen_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenController createState() => SplashScreenController();
}

class SplashScreenController extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this)
      ..duration = const Duration(seconds: 2)
      ..forward();
  }

  changeOnboardView() {
    animationController.forward();
    if (currentIndex < 3) {
      setState(() {
        currentIndex++;
      });
    } else {
      context.goNamed(RouteConstants.login);
    }
  }

  @override
  Widget build(BuildContext context) => SplashScreenView(this);
}
