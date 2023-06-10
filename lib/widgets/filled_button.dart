import 'package:exprezon_driver/widgets/text.dart';
import 'package:flutter/cupertino.dart';

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
}
