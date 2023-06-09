import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontSize = 14,
      this.color,
      this.fontWeight = FontWeight.w500,
      this.textAlign,
      this.lineHeight,
      this.textDecoration,
      this.fontFamily});
  final String text;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final double? lineHeight;
  final TextDecoration? textDecoration;
  final String? fontFamily;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: fontSize,
            fontWeight: fontWeight,
            decoration: textDecoration,
            height: lineHeight,
            color: color,
            fontFamily: "Poppins",
          ),
    );
  }
}
