import 'package:flutter/widgets.dart';
import 'package:rocket_apps_mvvm/foundation/view.dart';

class StateFullView extends View {
  late Map<int, Widget Function(dynamic)> stateMap;

  Widget buildStateWidget(vm) {
    return stateMap[vm.state]!.call(vm);
  }
}
