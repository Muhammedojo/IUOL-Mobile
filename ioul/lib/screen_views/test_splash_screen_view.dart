import 'package:flutter/material.dart';
import 'package:ioul/packages/package.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/test_splash_screen_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class TestSplashScreenView
    extends StatelessView<TestSplashScreen, TestSplashScreenController> {
  const TestSplashScreenView(TestSplashScreenController state, {Key? key})
      : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return Center(
      child: Padding(
        padding:REdgeInsets.symmetric(horizontal: 74.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome to the test portal',
              style: Styles.x16dp_4EAFFF_500w(),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Here, you will see all the available and completed test.',
              textAlign: TextAlign.center,
              style: Styles.x16dp_090A0A_400w(),
            ),
          ],
        ),
      ),
    );
  }
}
