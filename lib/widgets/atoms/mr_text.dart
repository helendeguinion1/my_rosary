import 'package:flutter/material.dart';

class MrText extends StatelessWidget {
  const MrText(
      {Key? key,
      this.text,
      this.color = Colors.black,
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal, 
      this.textAlign = TextAlign.start})
      : super(key: key);

  final String? text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      textAlign: textAlign,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
