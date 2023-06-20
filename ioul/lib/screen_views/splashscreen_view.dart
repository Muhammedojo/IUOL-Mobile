import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/screens.dart';
import 'stateless_view.dart';

class SplashScreenView
    extends StatelessView<SplashScreen, SplashScreenController> {
  const SplashScreenView(SplashScreenController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(CupertinoPageRoute(
            builder: (BuildContext context) => const Home())));

    return SafeArea(
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color:const Color(0xffC4E4FF),
            child: Center(
              child:

              Image.asset(
              'assets/images/logos.png',
                fit: BoxFit.cover,
              ),
            )),
      ),
    );
  }
}
