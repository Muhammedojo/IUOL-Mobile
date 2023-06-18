//import '../helpers/helper.dart' hide Key;
import 'package:flutter/material.dart';

class WidgetWrapper extends StatelessWidget {
  final Widget child;

  const WidgetWrapper({ required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
