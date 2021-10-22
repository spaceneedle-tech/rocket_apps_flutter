import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

class Bindable extends ChangeNotifier {
  Map _items = Map<String, Object>();
  bool canNotify = true;

  String _getCallerName() {
    String? member = Trace.current().frames[2].member;
    return member!.substring(member.indexOf(".") + 1).replaceAll("=", "");
  }

  T? get<T>({String? property}) {
    if (property == null || property.isEmpty) {
      property = _getCallerName();
    }

    if (!_items.containsKey(property)) {
      return null;
    }

    return _items[property] as T;
  }

  void set(Object value, {String? property}) {
    if (property == null || property.isEmpty) {
      property = _getCallerName();
    }

    _items[property] = value;

    if (canNotify) {
      notifyListeners();
    }
  }

  void freeze() {
    canNotify = false;
  }

  void unfreeze() {
    canNotify = true;
    notifyListeners();
  }
}
