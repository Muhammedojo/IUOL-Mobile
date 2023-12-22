import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:ioul/packages/package.dart';

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

  normalNavigation(Widget destination) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => destination));
  }
}
