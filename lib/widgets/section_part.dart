import 'package:flutter/material.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/text.dart';

class SectionPart extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const SectionPart({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CText(
          text,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        onTap == null
            ? Container()
            : InkWell(
                onTap: onTap,
                child: CText(
                  'Lihat Semua',
                  fontSize: 14,
                  color: primaryColor,
                ),
              ),
      ],
    );
  }
}
