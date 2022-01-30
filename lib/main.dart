import 'package:flutter/material.dart';
import 'package:cities/screens/home.dart';

import 'utils/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cities',
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColor: mainColor,
        scaffoldBackgroundColor: mainColor,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Comfortaa',
              bodyColor: textColor,
              fontSizeFactor: 1.2,
              fontSizeDelta: 1.0,
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
