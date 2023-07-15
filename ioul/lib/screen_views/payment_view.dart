import 'package:flutter/material.dart';
import '../components/components.dart';
import '../screens/screens.dart';
import '../screens_controllers/payment_controller.dart';
import '../values/values.dart';
import 'stateless_view.dart';

class PaymentView extends StatelessView<Payment, PaymentController> {
  const PaymentView(PaymentController state, {Key? key}) : super(state, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundWhite,
        body: WidgetWrapper(child:_body())
    );
  }
  Widget _body() {
    return InkWell(onTap:(){
      state.makePayment();
    }, child: const SizedBox(child: Text('Click me na '),));
  }
}
