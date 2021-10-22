import 'package:flutter/widgets.dart';

typedef S ViewModelCreator<S>(BuildContext context);
typedef S1 ViewCreator<S1>(BuildContext context, vm);

//class Arise<T> {
//ViewModelCreator<T> creator;
class Arise {
  static T viewModel<T>(ViewModelCreator<T> creator, BuildContext context) {
    var x = creator(context);

    return x;
  }

  static T view<T>(BuildContext context, vm) {
    ViewCreator<T>? creator;

    var x = creator!(context, vm);

    return x;
  }
}

// T arise(T Function(BuildContext) creator, BuildContext context) {
//   return creator(context);
// }
//}
