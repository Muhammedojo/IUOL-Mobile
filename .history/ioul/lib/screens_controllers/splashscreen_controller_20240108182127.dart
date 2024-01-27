import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ioul/router/router.dart';
import '../screen_views/splashscreen_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenController createState() => SplashScreenController();
}

class SplashScreenController extends State<SplashScreen> with SingleTickerProviderStateMixin {
  final AnimationController animationController = AnimationController();
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    // setCurrentIndex(1);
  }

  changeOnboardView() async {
    if (currentIndex < 4) {
      setState(() {
        currentIndex++;
      });
    } else {
      context.goNamed(RouteConstants.login);
    }
  }

  setCurrentIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) => SplashScreenView(this);
}
