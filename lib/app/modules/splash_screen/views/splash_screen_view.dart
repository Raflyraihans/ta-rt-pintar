// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/env/color.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenView({Key? key}) : super(key: key);

  SplashScreenController c = Get.find<SplashScreenController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  secondaryColor,
                  primaryColor,
                ],
                stops: const [
                  0.1,
                  0.9,
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  left: 50,
                  right: 50,
                  top: 0,
                  child: SizedBox(
                    child: Image.asset(
                      'assets/image/logo_splash.png',
                      scale: 0.5,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/image/kota_splash.png'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
