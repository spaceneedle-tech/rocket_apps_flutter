import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rocket_apps_mvvm/binding/bindable.dart';
import 'package:rocket_apps_mvvm/movement/mover.dart';

class ViewModel extends Bindable {
  BuildContext context;
  late Mover mover;

  ViewModel(this.context) {
    mover = Mover(context);
  }

  final services = GetIt.instance;

  int get state => get(property: "state");
  set state(int value) => set(value, property: "state");

  Future? loaded() {}

  Future? didBack() {}

  Future? didLeft() {}

  Future goTo(String route, {bool animate = true}) {
    return mover.go(route, animate: animate).then((value) => didLeft());
  }

  Future goToWithArguments(String route, Object arguments,
      {bool animate = true}) {
    return mover.goWithArguments(route, arguments, animate: animate);
  }

  Future popAndGoToWithArguments(String route, Object arguments,
      {bool animate = true}) {
    return mover.popAndGoWithArguments(route, arguments, animate: animate);
  }

  void goBack() {
    mover.goBack();
  }

  Future goToSilently(Widget widget) {
    return mover.goSilently(widget).then((value) => didLeft());
  }

  Object? getArgs() {
    return ModalRoute.of(this.context)!.settings.arguments;
  }
}
