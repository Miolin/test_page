import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_page/src/di/providers_creator.dart';
import 'package:test_page/src/screens/home_screen.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProvidersCreator(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          buttonTheme: ButtonThemeData(
            height: 26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            // textTheme: ButtonTextTheme.accent,
          ),
          textTheme: TextTheme(
            button: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}