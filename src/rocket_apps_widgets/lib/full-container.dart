import 'package:flutter/material.dart';

class FullContainer extends StatelessWidget {
  const FullContainer({
    Key? key,
    required this.child,
    this.color,
    this.padding = const EdgeInsets.all(17),
    this.boxConstraints,
  }) : super(key: key);

  final Widget child;
  final Color? color;
  final EdgeInsets padding;
  final BoxConstraints? boxConstraints;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: child,
      color: color,
      padding: padding,
      constraints: boxConstraints,
    );
  }
}
