import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/env/color.dart';

class BodyBuilder extends StatelessWidget {
  final Widget child;
  const BodyBuilder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      GetBuilder<HomeController>(
          init: HomeController(),
          builder: (c) {
            return c.loading == true
                ? const Opacity(
                    opacity: 0.3,
                    child:
                        ModalBarrier(dismissible: false, color: Colors.black),
                  )
                : Container();
          }),
      GetBuilder<HomeController>(
          init: HomeController(),
          builder: (c) {
            return c.loading == true
                ? Center(
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container();
          }),
    ]);
  }
}
