import 'package:flutter/material.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/text.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const PrimaryButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CText(
            text,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SecondaryButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: CText(
            text,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
