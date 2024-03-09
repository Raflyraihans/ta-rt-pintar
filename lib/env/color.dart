import 'package:flutter/material.dart';

Color primaryColor = const Color(0xff0084FD);
Color secondaryColor = const Color(0xff38A0FF);
Color textColor = const Color(0xff222222);
Color menuColor = const Color(0xff19B8E0);
Color subtextColor = const Color(0xffAAAAAA);
Color dangerRed = const Color(0xffFF3333);

const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);
