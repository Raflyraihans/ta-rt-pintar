import 'package:flutter/material.dart';
import 'package:rtkita/widgets/text.dart';

class StatistikItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  const StatistikItem(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 64,
          width: 64,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 1),
                  blurRadius: 15.0),
            ],
          ),
          child: Center(
            child: Icon(
              icon,
              size: 32,
              color: iconColor,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 100,
              child: CText(
                title,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            CText(
              subtitle,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ],
        )
      ],
    );
  }
}
