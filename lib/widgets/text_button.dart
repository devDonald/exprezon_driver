import 'package:exprezon_driver/widgets/text.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExprezonDrTextButton extends StatelessWidget {
  String text;
  Function()? onPressed;
  ExprezonDrTextButton({
    required this.text,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      //pad//ding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: ExprezonDrText(
        text,
      ),
    );
  }
}
