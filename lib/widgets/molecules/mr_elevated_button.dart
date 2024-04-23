import 'package:flutter/material.dart';
//Widget
import 'package:my_rosary/widgets/atoms/mr_text.dart';

class MrElevatedButton extends StatelessWidget {
  const MrElevatedButton(
      {Key? key,
      this.text,
      this.textColor = const Color(0xff67729D),
      this.textSize = 14.0,
      this.onPressed,
      this.textWeight = FontWeight.normal})
      : super(key: key);

  final String? text;
  final Color textColor;
  final double textSize;
  final FontWeight textWeight;
  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xfff3dadb)),
      child: MrText(
        text: text,
        color: textColor,
        fontSize: textSize,
        fontWeight: textWeight,
      ),
      onPressed: onPressed as void Function()?,
    );
  }
}
