import 'package:flutter/cupertino.dart';

class NavigatorHelper {
  BuildContext context;

  NavigatorHelper(this.context);

  closeScreen() {
    Navigator.pop(context);
  }
}