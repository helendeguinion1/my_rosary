// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
//Widget
import 'package:my_rosary/widgets/atoms/mr_checkbox.dart';
import 'package:my_rosary/widgets/atoms/mr_text.dart';

class MrLabeledCheckBox extends StatelessWidget {
  final EdgeInsets? padding;
  final bool value;
  final Function onChanged;
  final String label;

  const MrLabeledCheckBox({
    required this.value,
    required this.onChanged,
    required this.label,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
          padding: padding!,
          child: Row(
            children: <Widget>[
              Expanded(
                  child: MrText(
                text: label,
              )),
              MrCheckbox(
                isChecked: value,
                onChanged: (bool? newValue) {
                  onChanged(newValue);
                },
              )
            ],
          )),
    );
  }
}
