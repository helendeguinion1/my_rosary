import 'package:flutter/material.dart';
//Widgets
import 'package:my_rosary/widgets/organisms/mr_scaffold.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MrScaffold(
      appBarTitle: MrText(text: "My Rosary", color: Colors.black,),
      body: Center(
        child: MrText(text: 'Rosary',)
      )
    );
  }
}