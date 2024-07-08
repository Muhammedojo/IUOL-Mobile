import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/router.dart';
import '../view/splashscreen_view.dart';

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
    animationController = AnimationController(
        vsync: this, animationBehavior: AnimationBehavior.preserve)
      ..duration = const Duration(seconds: 1)
      ..forward();
  }

  changeOnboardView() {
    if (currentIndex < 3) {
      setState(() {
        currentIndex++;
      });
      animationController.reset();
      animationController.forward();
    } else {
      context.goNamed(RouteConstants.login);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SplashScreenView(this);
}
