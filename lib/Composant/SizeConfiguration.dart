import 'package:flutter/material.dart';

class SizeConfiguration {
  static late MediaQueryData _mediaQueryData;
  static late double screenheight;
  static late double screenwidth;
  static late double defaultSize;
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenheight = _mediaQueryData.size.height;
    screenwidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenheight * 0.24
        : screenwidth * 0.24;
  }
}
