import 'package:flutter/material.dart';
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
        child: const Center(child: Text('Pray Rosary Daily'),),
      ),
      ListTile(
        title: const MrText(text: "Rosary Guide",),
        onTap: () {
          Navigator.pushNamed(context, '/rosary-guide');
        },
      )
    ]));
  }
}