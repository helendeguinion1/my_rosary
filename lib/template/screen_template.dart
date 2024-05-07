// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_rosary/widgets/organisms/mr_android_bottom_nav.dart';
// import 'dart:io';
//Tab screens
import 'package:my_rosary/screens/prayers/prayers_tab_screen.dart';
import 'package:my_rosary/screens/journal/journal_tab_screen.dart';
import 'package:my_rosary/screens/profile/profile_tab_screen.dart';

class ScreenTemplate extends StatefulWidget {
  const ScreenTemplate({
    Key? key,
    required this.body,
    required this.currIndex,
  }) : super(key: key);
  final Widget body;
  final int currIndex;
  @override
  State<ScreenTemplate> createState() => _ScreenTemplateState();
}

class _ScreenTemplateState extends State<ScreenTemplate> {
  // int _currIndex = 0;
  int currentIndex = 0;
  late Widget _body;
  @override
  Widget build(BuildContext context) {
    return // @TODO helen for IOS
        // Platform.isIOS
        //     ? CupertinoTabScaffold(
        //         tabBar: CupertinoTabBar(
        //             onTap: (int i) {
        //               setState(() {
        //                 _currIndex = i;
        //               });
        //             },
        //             currentIndex: _currIndex,
        //             items: const [
        //               BottomNavigationBarItem(
        //                   label: 'Home', icon: Icon(CupertinoIcons.home)),
        //               BottomNavigationBarItem(
        //                   label: 'Prayers', icon: Icon(Icons.church)),
        //               BottomNavigationBarItem(
        //                 label: 'Journal',
        //                 icon: Icon(Icons.notes),
        //               ),
        //             ]),
        //         tabBuilder: (BuildContext context, int index) {

        //         })
        //     :
        Scaffold(
            body: currentIndex == 0 ? widget.body : _body,
            bottomNavigationBar: MrAndroidBottomNav(
              currentIndex: widget.currIndex,
              onTap: (int i) async {
                setState(() {
                  currentIndex = i;
                });
                switch (i) {
                  case 1:
                    setState(() {
                      _body = const PrayersTabScreen();
                    });
                    break;
                  case 2:
                    setState(() {
                      _body = const JournalTabScreen();
                    });
                    break;
                  case 3:
                    setState(() {
                      _body = const ProfileTabScreen();
                    });
                    break;
                }
              },
            ));
  }
}
