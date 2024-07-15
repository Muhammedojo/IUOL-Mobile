import 'package:flutter/material.dart';
import '../components/components.dart';
import '../screens_controllers/mvc_controller.dart';
import '../core/values/values.dart';
import '../core/utils/mvc.dart';

class BlankView extends StatelessView<Blank, BlankController> {
  const BlankView(BlankController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child: _body()));
  }

  Widget _body() {
    return const SizedBox();
  }
}
