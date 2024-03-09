import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/providers/verifikasi_kk.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/header_section.dart';
import 'package:rtkita/widgets/text.dart';

import '../controllers/verif_kk_controller.dart';

class VerifKkView extends GetView<VerifKkController> {
  VerifKkView({Key? key}) : super(key: key);

  final VerifKKProvider verifKKProvider = VerifKKProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBuilder(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(FluentIcons.arrow_left_24_regular),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    children: [
                      const HeaderSection(
                        headerText: 'Verifikasi',
                        subheaderText: 'Kartu Keluarga',
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset('assets/image/verif_kk.png'),
                      const SizedBox(
                        height: 30,
                      ),
                      const CText(
                          'Verifikasi Nomor KK anda terlebih dahulu. Pastikan Nomor KK anda benar dan sudah terdaftar.'),
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<VerifKkController>(
                        init: VerifKkController(),
                        builder: (c) {
                          return TextField(
                            controller: c.nomorKK,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Nomor KK',
                              prefixIcon:
                                  const Icon(FluentIcons.person_24_regular),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      PrimaryButton(
                        onTap: () {
                          verifKKProvider.checkKK(context);
                        },
                        text: 'Kirim',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
