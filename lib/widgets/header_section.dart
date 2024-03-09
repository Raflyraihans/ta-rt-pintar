import 'package:flutter/material.dart';
import 'package:rtkita/widgets/text.dart';

class HeaderSection extends StatelessWidget {
  final String headerText;
  final String? subheaderText;
  final String? subText;
  const HeaderSection(
      {Key? key, required this.headerText, this.subText, this.subheaderText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(headerText),
        subheaderText == null ? Container() : SubHeaderText(subheaderText!),
        const SizedBox(
          height: 12,
        ),
        subText == null ? Container() : SubText(subText!),
      ],
    );
  }
}
