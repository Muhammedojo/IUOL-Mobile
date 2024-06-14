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

  goNamedScreen(String path, Object? extra) {
    return GoRouter.of(context).goNamed(path, extra: extra);
  }

  normalNavigation(Widget destination) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => destination));
  }

  pushReplaceNavigation(Widget destination) {
    return Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => destination));
  }
}
