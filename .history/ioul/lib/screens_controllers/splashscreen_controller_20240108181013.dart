import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ioul/router/router.dart';
import '../screen_views/splashscreen_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenController createState() => SplashScreenController();
}

class SplashScreenController extends State<SplashScreen> {
  final PageController pageController = PageController();
  int currentIndex = 1;

  @override
  void initState() {
    super.initState();
    setCurrentIndex(1);
  }

  changeOnboardView() async {
    // log("currentIndex: $currentIndex");
    if (currentIndex < 4) {
      setState(() {
        pageController.animateToPage(currentIndex++,
            duration: const Duration(milliseconds: 600),
            curve: Curves.fastOutSlowIn);
        setCurrentIndex(currentIndex++);
      });
    }

    if (currentIndex == 4) {
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
