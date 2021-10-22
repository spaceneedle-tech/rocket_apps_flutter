import 'package:flutter/widgets.dart';

class Slope {
  static BoxDecoration vertical(Color topColor, Color bottomColor) {
    return linear(
        Alignment.topCenter, Alignment.bottomCenter, topColor, bottomColor);
  }

  static BoxDecoration horizontal(Color leftColor, Color rightColor) {
    return linear(
        Alignment.centerLeft, Alignment.centerRight, leftColor, rightColor);
  }

  static BoxDecoration linear(
      Alignment begin, Alignment end, Color beginColor, Color endColor) {
    return draw(
      begin,
      end,
      LinearGradient(begin: begin, end: end, colors: [beginColor, endColor]),
    );
  }

  static BoxDecoration draw(Alignment begin, Alignment end, Gradient gradient) {
    return BoxDecoration(gradient: gradient);
  }
}
