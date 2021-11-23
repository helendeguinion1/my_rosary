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
      appBar: AppBar(
        title: appBarTitle,
        actions: actions,
      ),
      drawer: drawer,
      body: body,
      floatingActionButton: floatingButton,
    );
  }
}
