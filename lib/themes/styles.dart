import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: 'Poppins',
  scaffoldBackgroundColor: Color(0xfff6740c),
  hintColor: Color(0xffffffff),
  primaryColor: Color(0xff171515),
  iconTheme: IconThemeData(color: Color(0xfffff9f9)),
  appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff181717),
      shadowColor: Color(0xffBCBCBC),
      iconTheme: IconThemeData(color: Colors.white)),
  textTheme: TextTheme(
    bodyText1: TextStyle(),
    headline2: TextStyle(),
    headline3: TextStyle(),
    headline4: TextStyle(),
    headline1: TextStyle(),
    subtitle1: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
    subtitle2: TextStyle(color: Color(0xffffffff)),
    headline5: TextStyle(fontWeight: FontWeight.w500),
    headline6: TextStyle(color: Colors.white, fontSize: 18),
    bodyText2: TextStyle(),
    caption: TextStyle(
      color: Color(0xfffffefe),
    ),
  ),
);

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
