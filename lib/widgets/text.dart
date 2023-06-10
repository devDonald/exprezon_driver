import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExprezonDrText extends StatelessWidget {
  String text;
  FontWeight? fontWeight;
  double? fontSize;
  Color? color;
  TextAlign? textAlign;

  ExprezonDrText(
    this.text, {
    this.fontWeight,
    this.textAlign,
    this.color,
    this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.notoSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
