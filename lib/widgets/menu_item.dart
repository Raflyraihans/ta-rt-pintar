import 'package:flutter/material.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/text.dart';

class CMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const CMenuItem(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                color: menuColor,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          CText(
            text,
            fontSize: 13,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
