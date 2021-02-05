export 'package:getx_demo/theme/style_color.dart';
export 'package:getx_demo/theme/style_sheet.dart';
export 'package:getx_demo/theme/image.dart';

import 'package:flutter/material.dart';
import 'package:getx_demo/packages/config_package.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: bgColor,
    primaryColor: primaryColor,
    canvasColor: bgColor,
    appBarTheme: AppBarTheme(color: primaryColor, iconTheme: IconThemeData(color: Colors.white)),
    iconTheme: IconThemeData(color: primaryColor.withOpacity(0.4)),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: textPrimaryColor,
      ),
      bodyText2: TextStyle(color: textPrimaryColor),
      headline4: TextStyle(color: textPrimaryColor),
    ),
    //unselectedWidgetColor: Colors.blue[400],
    /*buttonTheme: ButtonThemeData(
      buttonColor: Colors.blueAccent,
      textTheme: ButtonTextTheme.primary,
    ),*/
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey[700],
    canvasColor: Colors.grey[800],
    toggleableActiveColor: Colors.grey[300],
    appBarTheme: AppBarTheme(color: Colors.grey[900], iconTheme: IconThemeData(color: Colors.grey[100])),
    iconTheme: IconThemeData(color: Colors.grey[300]),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
      ),
      bodyText2: TextStyle(color: Colors.white),
      headline4: TextStyle(color: Colors.white),
    ),
    /*unselectedWidgetColor: Colors.grey[300],
    dividerColor: Colors.grey[500],
    buttonTheme: ButtonThemeData(buttonColor: Colors.grey[900], textTheme: ButtonTextTheme.primary),*/
  );
}
