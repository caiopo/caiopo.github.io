import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:personal_site/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'caiopo\'s website',
      theme: buildTheme(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

ThemeData buildTheme() {
  final base = ThemeData.dark();
  return base.copyWith(
    textTheme: buildTextTheme(),
  );
}

TextTheme buildTextTheme() {
  final baseTheme = TextTheme(
    headline1: TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w500,
      letterSpacing: -1.5,
    ),
    headline2: TextStyle(
      fontSize: 58,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.5,
    ),
    headline3: TextStyle(
      fontSize: 46,
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
      fontSize: 33,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    caption: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );

  // return GoogleFonts.aleoTextTheme(baseTheme);
  return GoogleFonts.poppinsTextTheme(baseTheme);
}
