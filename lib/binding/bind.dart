import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Bind<T extends ChangeNotifier> extends StatelessWidget {
  Bind({
    required this.create,
    required this.builder,
    // Key key,
    // Widget child,
  });

  final Create<T> create;
  final Widget Function(BuildContext context, T value, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        create: create, child: Consumer<T>(builder: builder));
  }
}
