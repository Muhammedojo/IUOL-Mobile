import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../router/route_constants.dart';
import '../screens/screens.dart';
import 'stateless_view.dart';

class SplashScreenView
    extends StatelessView<SplashScreen, SplashScreenController> {
  const SplashScreenView(SplashScreenController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2,
                color: const Color(0xffC4E4FF),
                child: Center(
                  child: Image.asset(
                    'assets/images/logos.png',
                    fit: BoxFit.cover,
                  ),
                )),
            ElevatedButton(
                onPressed: () => context.goNamed(RouteConstants.courses),
                child: Text("Move to Home"))
          ],
        ),
      ),
    );
  }
}
