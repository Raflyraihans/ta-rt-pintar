import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/providers/announcement.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/text.dart';

import '../controllers/pengumuman_controller.dart';

class PengumumanView extends GetView<PengumumanController> {
  PengumumanView({Key? key}) : super(key: key);
  final AnnouncementProvider announcementProvider = AnnouncementProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyBuilder(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 56,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 10))
                    ]),
                // ignore: prefer_const_literals_to_create_immutables
                child: Row(children: [
                  Expanded(
                    child: Container(
                        transform: Matrix4.translationValues(-20, 0, 0),
                        // ignore: prefer_const_constructors
                        child: BackButton()),
                  ),
                  // ignore: prefer_const_constructors
                  Expanded(
                    flex: 2,
                    child: const Center(
                      child: Text(
                        'Pengumuman',
                        style: TextStyle(
                          // ignore: unnecessary_const
                          color: Colors.white,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                ]),
              ),
              Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: GetBuilder<HomeController>(
                      init: HomeController(),
                      builder: (c) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: c.announcement.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      offset: const Offset(0, 1),
                                      blurRadius: 15.0),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CText(
                                    c.announcement[index].title != null
                                        ? c.announcement[index].title!
                                        : "",
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  CText(
                                      c.announcement[index].description != null
                                          ? c.announcement[index].description!
                                          : ""),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
