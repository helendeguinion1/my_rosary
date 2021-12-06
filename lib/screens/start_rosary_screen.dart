import 'package:flutter/material.dart';
//Widget
import 'package:my_rosary/widgets/organisms/mr_scaffold.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';
import 'package:my_rosary/widgets/molecules/mr_labeled_checkbox.dart';

class StartRosaryScreen extends StatefulWidget {
  const StartRosaryScreen({Key? key, this.currentMystery}) : super(key: key);

  final String? currentMystery;
  @override
  _StartRosaryScreenState createState() => _StartRosaryScreenState();
}

class _StartRosaryScreenState extends State<StartRosaryScreen> {
  final _steps = Steps();
  @override
  Widget build(BuildContext context) {
    return MrScaffold(
      appBarTitle: MrText(
        text: widget.currentMystery,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      body: ListView(padding: EdgeInsets.zero, children: <Widget>[
        MrLabeledCheckBox(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: _steps.signOfTheCross,
            onChanged: (bool? newValue) {
              setState(() {
                _steps.signOfTheCross = newValue!;
              });
            },
            label: "Sign of the Cross"),
        Divider(
          color: Colors.teal[50],
        ),
        MrLabeledCheckBox(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: _steps.appostlesCreed,
            onChanged: (bool? newValue) {
              setState(() {
                _steps.appostlesCreed = newValue!;
              });
            },
            label: "Recite Apostle's Creed"),
        const Divider(),
        MrLabeledCheckBox(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: _steps.ourFather,
            onChanged: (bool? newValue) {
              setState(() {
                _steps.ourFather = newValue!;
              });
            },
            label: "Recite Our Father"),
        const Divider(),
        MrLabeledCheckBox(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: _steps.threeHailMary,
            onChanged: (bool? newValue) {
              setState(() {
                _steps.threeHailMary = newValue!;
              });
            },
            label: "Recite Hail Mary (3x)"),
        const Divider(),
        MrLabeledCheckBox(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            value: _steps.gloryBe,
            onChanged: (bool? newValue) {
              setState(() {
                _steps.gloryBe = newValue!;
              });
            },
            label: "Recite Glory Be"),
      ]),
    );
  }
}

class Steps {
  bool signOfTheCross;
  bool appostlesCreed;
  bool ourFather;
  bool threeHailMary;
  bool gloryBe;

  Steps(
      {this.signOfTheCross = false,
      this.appostlesCreed = false,
      this.ourFather = false,
      this.threeHailMary = false,
      this.gloryBe = false});
}
