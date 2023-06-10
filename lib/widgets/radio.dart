import 'package:exprezon_driver/widgets/text.dart';
import 'package:flutter/material.dart';

class ExprezonDrRadio extends StatelessWidget {
  ExprezonDrRadio(
      {required this.text,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      super.key});
  String text;
  Object value;
  Object? groupValue;
  Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: value,
          // splashRadius: 0,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        ExprezonDrText(text),
      ],
    );
  }
}
