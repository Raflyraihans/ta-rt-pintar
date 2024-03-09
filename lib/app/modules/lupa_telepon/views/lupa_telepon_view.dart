import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/header_section.dart';
import 'package:rtkita/widgets/text.dart';

import '../controllers/lupa_telepon_controller.dart';

class LupaTeleponView extends GetView<LupaTeleponController> {
  const LupaTeleponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      headerText: 'Lupa',
                      subheaderText: 'No. Telepon',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset('assets/image/forgot.png'),
                    const SizedBox(
                      height: 30,
                    ),
                    const CText(
                        'Masukkan No. KK anda yang terdaftar sesuai dengan akun anda.'),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Nomor KK',
                        prefixIcon: const Icon(FluentIcons.person_24_regular),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(
                      onTap: () {},
                      text: 'Kirim',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
