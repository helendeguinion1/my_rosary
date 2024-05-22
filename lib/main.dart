import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//Screens
import 'package:my_rosary/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Habit',
      theme: ThemeData(
          canvasColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Color(0xfff3dadb))),
      home: const HomeScreen(),
    );
  }
}
