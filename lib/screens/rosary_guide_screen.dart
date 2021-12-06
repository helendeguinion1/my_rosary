import 'package:flutter/material.dart';
//Widget
import 'package:my_rosary/widgets/organisms/mr_scaffold.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';

class RosaryGuideScreen extends StatelessWidget {
  const RosaryGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MrScaffold(
      appBarTitle: const MrText(
        text: "Guide",
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      body: Image.asset(
        'assets/images/rosary_guide.png',
        height: 750,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
