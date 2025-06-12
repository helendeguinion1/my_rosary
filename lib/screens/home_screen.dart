import 'package:flutter/material.dart';
import 'package:my_rosary/template/screen_template.dart';
import 'package:my_rosary/widgets/organisms/quotes/mr_qoutes_placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const ScreenTemplate(
        body: Column(
          children: [MrQoutesPlaceHolder()],
        ),
        currIndex: 0);
  }
}
