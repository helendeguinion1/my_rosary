import 'package:flutter/material.dart';

class MrScaffold extends StatelessWidget {
  const MrScaffold(
      {Key? key,
      this.appBarTitle,
      this.body,
      this.actions,
      this.floatingButton,
      this.drawer,
      this.resizeBottomInset = false})
      : super(key: key);

  final Widget? appBarTitle;
  final Widget? body;
  final List<Widget>? actions;
  final Widget? floatingButton;
  final Widget? drawer;
  final bool resizeBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeBottomInset,
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: appBarTitle,
        actions: actions,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: drawer,
      body: body,
      floatingActionButton: floatingButton,
    );
  }
}
