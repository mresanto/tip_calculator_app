import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: Colors.purple,
    textTheme: lightTextTheme);

TextStyle lightbodyText1 = TextStyle(fontSize: 16.0, color: Colors.purple);
TextStyle lightbodyText2 = TextStyle(fontSize: 16.0);

TextTheme lightTextTheme = TextTheme(
  bodyText1: lightbodyText1,
  bodyText2: lightbodyText2,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorSchemeSeed: Colors.purple,
  textTheme: darkTextTheme,
);

TextStyle darkbodyText1 = TextStyle(fontSize: 16.0, color: Colors.purpleAccent);
TextStyle darkbodyText2 = TextStyle(fontSize: 16.0);

TextTheme darkTextTheme = TextTheme(
  bodyText1: darkbodyText1,
  bodyText2: darkbodyText2,
);
