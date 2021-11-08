import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rocket_apps_mvvm/foundation/viewmodel.dart';

class View with RouteAware {
  static late RouteObserver<PageRoute> routeObserver;

  late bool _isObservingRoute = false;
  late ViewModel viewModel;

  View() {
    //WidgetsBinding.instance.addPostFrameCallback((_) => loaded());
  }

  @override
  void didPush() {
    // Route was pushed onto navigator and is now topmost route.
    viewModel.loaded();
  }

  @override
  void didPopNext() {
    viewModel.didBack();
  }

  late Size size;

  void loaded() {}

  build(BuildContext context, vm, child) {
    size = MediaQuery.of(context).size;

    if (!this._isObservingRoute) {
      this._isObservingRoute = true;
      routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    }
  }

  Future<T?> showScreenModal<T>(Widget widget, BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    return showModalBottomSheet<T>(
      shape: RoundedRectangleBorder(),
      context: context,
      builder: (context) {
        return Container(
          width: size.width,
          height: size.height,
          child: widget,
        );
      },
    );
  }

  Future<T?> showCustomModal<T>(Widget widget, BuildContext context) async {
    return showModalBottomSheet<T>(
      context: context,
      builder: (context) => widget,
    );
  }
}
