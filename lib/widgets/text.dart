import 'package:flutter/material.dart';
import 'package:rtkita/env/color.dart';

class CText extends StatelessWidget {
  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const CText(this.data,
      {Key? key,
      this.color = const Color(0xff222222),
      this.fontSize = 14,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.start,
      this.maxLines,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}

class HeaderText extends StatelessWidget {
  final String text;
  const HeaderText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CText(
      text,
      color: primaryColor,
      fontSize: 36,
      fontWeight: FontWeight.w600,
    );
  }
}

class SubHeaderText extends StatelessWidget {
  final String text;
  const SubHeaderText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CText(
      text,
      color: subtextColor,
      fontSize: 36,
      fontWeight: FontWeight.w600,
    );
  }
}

class SubText extends StatelessWidget {
  final String text;
  const SubText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CText(
      text,
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }
}
