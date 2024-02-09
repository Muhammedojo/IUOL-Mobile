import 'package:flutter/material.dart';
import '../components/components.dart';
import '../screens_controllers/review_application_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class ReviewApplicationView
    extends StatelessView<ReviewApplication, ReviewApplicationController> {
  const ReviewApplicationView(ReviewApplicationController state, {Key? key})
      : super(state, key: key);

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
