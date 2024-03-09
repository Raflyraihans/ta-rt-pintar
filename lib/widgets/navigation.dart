// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:rtkita/env/color.dart';

class ItemNavbar extends StatelessWidget {
  final active;
  final IconData? icon;
  final itemName;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ItemNavbar(this.active, {this.icon, this.itemName});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      width: 65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          active == true
              ? Icon(
                  icon,
                  color: primaryColor,
                  size: 30,
                )
              : Icon(
                  icon,
                  color: subtextColor,
                  size: 30,
                ),
          const SizedBox(height: 5),
          Text(
            itemName,
            style: TextStyle(
              fontSize: 12,
              color: active == true ? primaryColor : subtextColor,
            ),
          ),
          const SizedBox(height: 10),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
            height: active == true ? 2 : 0,
            width: 20,
            color: active == true ? Colors.white : Colors.transparent,
          )
        ],
      ),
    );
  }
}
