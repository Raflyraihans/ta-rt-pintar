import 'package:flutter/material.dart';
import 'package:rtkita/env/color.dart';

class ListAction extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const ListAction({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: subtextColor.withOpacity(0.2), width: 2),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right_rounded,
              color: textColor,
            )
          ],
        ),
      ),
    );
  }
}
