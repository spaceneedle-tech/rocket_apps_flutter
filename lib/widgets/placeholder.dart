import 'package:flutter/widgets.dart';

Widget placeHolder(double space) {
  return SizedBox(
    width: space,
    height: space,
  );
}

Widget horizontalPlaceHolder(double width) {
  return SizedBox(
    width: width,
    height: 1,
  );
}

Widget verticalPlaceHolder(double height) {
  return SizedBox(
    width: 1,
    height: height,
  );
}
