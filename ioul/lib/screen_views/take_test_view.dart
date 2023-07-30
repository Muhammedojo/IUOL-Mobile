import 'package:flutter/material.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/take_test_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class TakeTestView extends StatelessView<TakeTest, TakeTestController> {
  const TakeTestView(TakeTestController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child:_body())
    );
  }
  Widget _body() {
    return const SizedBox();
  }
}
