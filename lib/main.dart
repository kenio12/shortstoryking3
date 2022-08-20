import 'package:flutter/material.dart';
import 'package:shortstoryking3/screens/home_screen.dart';
import 'package:shortstoryking3/styles/fontStyle.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ShortStoryKing",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey,
          ),
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.orangeAccent,
        ),
        iconTheme: IconThemeData(
          color: Colors.pinkAccent
        ),
        fontFamily: BoldFont,
      ),
      home: HomeScreen(),
    );
  }
}
