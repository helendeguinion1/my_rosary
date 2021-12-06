import 'package:flutter/material.dart';
//Widget
import 'package:my_rosary/widgets/organisms/mr_scaffold.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';

class MysteryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MrScaffold(
      appBarTitle: MrText(
        text: 'Mystery',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      body: Center(child: MrText(text: "Test...")),
    );
  }
}
