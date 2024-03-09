import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/modules/aduan/controllers/aduan_controller.dart';
import 'package:rtkita/app/modules/manajemenPengumuman/controllers/manajemen_pengumuman_controller.dart';
import 'package:rtkita/app/providers/announcement.dart';
import 'package:rtkita/app/providers/complaint.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/dialog.dart';
import 'package:rtkita/widgets/text.dart';

class ManajemenPengumumanView extends GetView<ManajemenPengumumanController> {
  ManajemenPengumumanView({Key? key}) : super(key: key);

  final AnnouncementProvider p = AnnouncementProvider();
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
                  const Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        'Tambah Pengumuman',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
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
                child: GetBuilder<ManajemenPengumumanController>(
                  init: ManajemenPengumumanController(),
                  builder: (c) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      child: ListView(
                        children: [
                          TextField(
                            autocorrect: false,
                            controller: c.title,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Judul Pengumuman',
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextField(
                            autocorrect: false,
                            controller: c.description,
                            maxLines: 7,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Deskripsi Pengumuman',
                            ),
                          ),
                          const SizedBox(height: 24),
                          PrimaryButton(
                              text: 'Kirim',
                              onTap: () {
                                p.sendPengumuman(context);
                              }),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
