import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class NavigatorHelper {
  BuildContext context;

  NavigatorHelper(this.context);

  closeScreen() {
    Navigator.pop(context);
  }

  pushNamedScreen(String path) {
    GoRouter.of(context).pushNamed(path);
  }

  goNamedScreen(String path) {
    return GoRouter.of(context).goNamed(path);
  }
}
