import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/modules/persuratan/controllers/persuratan_controller.dart';
import 'package:rtkita/app/providers/persuratan.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/button.dart';

import '../../home/controllers/home_controller.dart';

class DetailAddPersuratanView extends GetView {
  final String text;
  DetailAddPersuratanView(this.text, {Key? key}) : super(key: key);

  final PersuratanProvider persuratanProvider = PersuratanProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BodyBuilder(
        child: SafeArea(
          child: Stack(
            children: [
              Column(
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
                        child: Center(
                          child: Text(
                            text,
                            style: const TextStyle(
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
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: GetBuilder<PersuratanController>(
                            init: PersuratanController(),
                            builder: (c) {
                              return Column(
                                children: [
                                  TextField(
                                    controller: c.namaLengkap,
                                    onTap: () {
                                      listUserSurat(context);
                                    },
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'Nama Lengkap (Dituju)',
                                      prefixIcon: const Icon(
                                          FluentIcons.person_24_regular),
                                      suffixIcon:
                                          const Icon(Icons.keyboard_arrow_down),
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  TextField(
                                    controller: c.deskripsiSurat,
                                    maxLines: 7,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'Deskripsi Surat',
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  GetBuilder<PersuratanController>(
                                        init: PersuratanController(),
                                        builder: (c) {
                                          return GetBuilder<HomeController>(
                                            init: HomeController(),
                                            builder: (homec) {
                                              return PrimaryButton(
                                                  text: 'Kirim',
                                                  onTap: () {
                                                    homec.loading == true;
                                                    if (text == 'Lainnya') {
                                                      persuratanProvider.sendRequestSurat(
                                                          context,
                                                          'SURAT PENGANTAR',
                                                          c.selectedFamilyMember!.id
                                                              .toString());
                                                    } else {
                                                      persuratanProvider.sendRequestSurat(
                                                          context,
                                                          'SURAT PENGANTAR (' + text + ')',
                                                          c.selectedFamilyMember!.id
                                                              .toString());
                                                    }
                                                  });
                                              });
                                        }),
                                ],
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
