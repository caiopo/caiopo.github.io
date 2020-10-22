import 'package:flutter/material.dart';
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
    textTheme: base.textTheme.apply(
      fontFamily: 'Inconsolata'
    ),
  );
}
