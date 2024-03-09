import 'dart:io';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/modules/aduan/controllers/aduan_controller.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/providers/complaint.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/dialog.dart';
import 'package:rtkita/widgets/text.dart';

class AddAduanView extends GetView {
  AddAduanView({Key? key}) : super(key: key);

  final AduanProvider p = AduanProvider();

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
                        'Tambah Aduan',
                        style: TextStyle(
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
                child: GetBuilder<AduanController>(
                  init: AduanController(),
                  builder: (c) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      child: ListView(
                        children: [
                          c.photo != null
                              ? ClipRRect(
                                  child: Image.file(
                                    File(c.photo!.path),
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    final ImagePicker picker = ImagePicker();
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SimpleBoxDialog(
                                          title: 'Pilih File..',
                                          child: Column(
                                            children: [
                                              Material(
                                                color: Colors.white,
                                                child: ListTile(
                                                  onTap: () async {
                                                    try {
                                                      XFile? data = await picker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera,
                                                              maxHeight: 640);
                                                      c.setImage(data);
                                                    } on PlatformException {
                                                      errorMessage(
                                                          'Platform Error');
                                                    } catch (e) {
                                                      errorMessage("Terjadi kesalahan dalam mengambil gambar");
                                                    }
                                                    Get.back();
                                                  },
                                                  leading: const Icon(
                                                    FluentIcons
                                                        .camera_24_regular,
                                                    color: Colors.black,
                                                  ),
                                                  title: const Text('Camera'),
                                                ),
                                              ),
                                              Material(
                                                color: Colors.white,
                                                child: ListTile(
                                                  onTap: () async {
                                                    try {
                                                      XFile? data = await picker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery,
                                                              maxHeight: 640);
                                                      c.setImage(data);
                                                    } on PlatformException {
                                                      errorMessage(
                                                          'Platform Error');
                                                    } catch (e) {
                                                      errorMessage("Terjadi kesalahan dalam memilih gambar");
                                                    }
                                                    Get.back();
                                                  },
                                                  leading: const Icon(
                                                    FluentIcons
                                                        .image_24_regular,
                                                    color: Colors.black,
                                                  ),
                                                  title: const Text('Galeri'),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FluentIcons.image_24_regular,
                                                color: subtextColor,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              Icon(
                                                FluentIcons.camera_24_regular,
                                                color: subtextColor,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 8),
                                          CText(
                                            'Gambar/Foto Aduan',
                                            color: subtextColor,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(height: 24),
                          TextField(
                            autocorrect: false,
                            controller: c.title,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Aduan',
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
                              hintText: 'Deskripsi Aduan',
                            ),
                          ),
                          const SizedBox(height: 24),
                          GetBuilder<AduanController>(
                                init: AduanController(),
                                builder: (c) {
                                  return GetBuilder<HomeController>(
                                      init: HomeController(),
                                      builder: (homec) {
                                        return PrimaryButton(
                                            text: 'Kirim',
                                            onTap: () {
                                              homec.loading == true;
                                              p.sendRequestAduan(context);
                                            });
                                      });
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
