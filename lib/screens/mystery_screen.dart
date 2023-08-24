import 'package:flutter/material.dart';
//Widget
import 'package:my_rosary/widgets/organisms/mr_scaffold.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';

class MysteryScreen extends StatelessWidget {
  const MysteryScreen({
    Key? key,
    this.rosaryName,
  }) : super(key: key);

  final String? rosaryName;

  _setMysteries() {
    switch (rosaryName) {
      case 'Joyful':
        RosariesMysteries(firstMystery: '');
        break;
      case 'Sorrowful':
        break;
      case 'Glorious':
        break;
      case 'Luminous':
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MrScaffold(
      appBarTitle: MrText(
        text: 'Mystery',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      body: Center(child: MrText(text: "Testingggg...")),
    );
  }
}

class RosariesMysteries {
  String? firstMystery;
  String? firstMyteryDesc;
  String? secondMystery;
  String? secondMyteryDesc;
  String? thirdMystery;
  String? thirdMyteryDesc;
  String? fourthMystery;
  String? fourthMyteryDesc;
  String? fifthMystery;
  String? fifthMyteryDesc;

  RosariesMysteries(
      {this.firstMystery,
      this.firstMyteryDesc,
      this.secondMystery,
      this.secondMyteryDesc,
      this.thirdMystery,
      this.thirdMyteryDesc,
      this.fourthMystery,
      this.fourthMyteryDesc,
      this.fifthMystery,
      this.fifthMyteryDesc});
}
