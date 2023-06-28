import 'package:flutter/material.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/sample_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class BlankView extends StatelessView<Blank, BlankController> {
  const BlankView(BlankController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:const Color(0xffffffff),
        body: WidgetWrapper(child:_body())
    );
  }
  Widget _body() {
    return const SizedBox();
  }
}
