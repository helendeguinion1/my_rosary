import 'package:flutter/material.dart';

class JournalTabScreen extends StatefulWidget {
  const JournalTabScreen({Key? key}) : super(key: key);

  @override
  State<JournalTabScreen> createState() => _JournalTabScreenState();
}

class _JournalTabScreenState extends State<JournalTabScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Center(child: Text("TODO Journal Feature")),
    );
  }
}
