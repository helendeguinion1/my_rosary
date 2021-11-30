import 'package:flutter/material.dart';
//Screens
import 'package:my_rosary/screens/main_screen.dart';
import 'package:my_rosary/screens/rosary_guide_screen.dart';
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
        appBarTheme: AppBarTheme(color: Colors.teal[200]!)
      ),
      home: const MainScreen(),
      routes: {
        '/rosary-guide': (context) => const RosaryGuideScreen()
      },
    );
  }
}