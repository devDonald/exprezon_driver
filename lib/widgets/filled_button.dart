import 'package:exprezon_driver/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExprezonDrFilledButton extends StatelessWidget {
  String text;
  Function()? onPressed;
  ExprezonDrFilledButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: ExprezonDrText(
        text,
      ),
    );
  }

  static Widget icon(BuildContext? context,
      {required IconData icon,
      required Text label,
      required Function()? onPressed}) {
    return ElevatedButton.icon(
        onPressed: onPressed, icon: Icon(icon), label: label);
  }
}
