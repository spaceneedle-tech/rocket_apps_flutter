import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class FullStack extends StatelessWidget {
  late Stack _stack;
  late Container _container;
  BoxDecoration? decoration;

  FullStack({
    Key? key,
    this.decoration,
    AlignmentGeometry alignment = AlignmentDirectional.topStart,
    TextDirection? textDirection,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
    required List<Widget> children,
  }) : super(
          key: key,
        ) {
    _stack = Stack(
      alignment: alignment,
      textDirection: textDirection,
      fit: fit,
      clipBehavior: clipBehavior,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    _container = Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: decoration,
    );

    _stack.children.insert(0, _container);

    return _stack;
  }
}
