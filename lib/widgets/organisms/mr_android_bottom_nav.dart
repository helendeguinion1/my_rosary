import 'package:flutter/material.dart';

class MrAndroidBottomNav extends StatefulWidget {
  const MrAndroidBottomNav(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);
  final int currentIndex;
  final Function(int) onTap;
  @override
  State<MrAndroidBottomNav> createState() => _MrAndroidBottomNavState();
}

class _MrAndroidBottomNavState extends State<MrAndroidBottomNav> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: const Color(0xFF2C3E50),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          widget.onTap(index);
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Home', icon: Icon(Icons.home_outlined)),
          BottomNavigationBarItem(
              label: 'Rosary', icon: Icon(Icons.church_outlined)),
          BottomNavigationBarItem(
            label: 'Journal',
            icon: Icon(Icons.notes),
          ),
          BottomNavigationBarItem(
            label: 'Me',
            icon: Icon(Icons.person_outline),
          ),
        ]);
  }
}
