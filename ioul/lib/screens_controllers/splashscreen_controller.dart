
import 'package:flutter/cupertino.dart';
import '../screen_views/splashscreen_view.dart';
import '../values/values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenController createState() => SplashScreenController();
}

class SplashScreenController extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) => SplashScreenView(this);



}
