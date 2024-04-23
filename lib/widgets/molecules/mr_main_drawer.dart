import 'package:flutter/material.dart';
import 'package:my_rosary/screens/rosary_guide_screen.dart';
//Widget
import 'package:my_rosary/widgets/atoms/mr_text.dart';

class MrMainDrawer extends StatelessWidget {
  const MrMainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.teal[200]!,
        ),
        child: const Center(
          child: MrText(
            text: 'Pray Rosary Daily',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      ListTile(
        title: const MrText(
          text: "Rosary Guide",
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const RosaryGuideScreen()));
        },
      )
    ]));
  }
}
