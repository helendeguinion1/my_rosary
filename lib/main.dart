import 'package:flutter/material.dart';
//Screens
import 'package:my_rosary/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          canvasColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Color(0xfff3dadb))),
      home: const HomeScreen(),
    );
  }
}
