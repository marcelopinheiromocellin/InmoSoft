import 'package:flutter/material.dart';

class SizeUtils {
  static MediaQueryData _mediaQuery;
  static double widthScreen;
  static double widthScreenWithoutStatusBar;
  static double heightScreen;
  static double statusBarHeight;

  static init(BuildContext context) {
    _mediaQuery = MediaQuery.of(context);
    widthScreen = _mediaQuery.size.width;
    widthScreenWithoutStatusBar =
        _mediaQuery.size.width - _mediaQuery.padding.top;
    heightScreen = _mediaQuery.size.height;
    statusBarHeight = _mediaQuery.padding.top;
  }
}
