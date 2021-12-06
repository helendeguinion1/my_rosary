import 'package:flutter/material.dart';

class MrCheckbox extends StatelessWidget {
  final bool? isChecked;
  final Function? onChanged;
  const MrCheckbox({Key? key, this.isChecked = false, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? newValue) => onChanged!(newValue!) as Function(bool)?,
    );
  }
}
