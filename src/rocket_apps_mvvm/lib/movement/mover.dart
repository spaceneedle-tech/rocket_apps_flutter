import 'package:flutter/widgets.dart';

class Mover {
  Mover(this.context);

  BuildContext context;

  Future go(String route, {bool animate = true}) async {
    return await Navigator.pushNamed(context, route);
  }

  Future goWithArguments(String route, Object arguments,
      {bool animate = true}) async {
    return await Navigator.pushNamed(context, route, arguments: arguments);
  }

  Future popAndGoWithArguments(String route, Object arguments,
      {bool animate = true}) async {
    return await Navigator.popAndPushNamed(context, route,
        arguments: arguments);
  }

  Future goSilently(Widget widget) async {
    return await Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => widget,
            transitionDuration: Duration(seconds: 0)));
  }

  Future start(String route) async {
    return await Navigator.pushNamed(context, route);
  }

  void goBack() {
    Navigator.pop(context);
  }

  bool canGoBack() {
    return Navigator.canPop(context);
  }
}
