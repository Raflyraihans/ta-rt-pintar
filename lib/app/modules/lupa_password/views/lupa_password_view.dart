import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/modules/lupa_telepon/views/lupa_telepon_view.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/header_section.dart';
import 'package:rtkita/widgets/text.dart';

import '../controllers/lupa_password_controller.dart';

class LupaPasswordView extends GetView<LupaPasswordController> {
  const LupaPasswordView({Key? key}) : super(key: key);
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
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                child: Column(
                  children: [
                    const HeaderSection(
                      headerText: 'Lupa',
                      subheaderText: 'Password',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset('assets/image/forgot.png'),
                    const SizedBox(
                      height: 30,
                    ),
                    const CText(
                        'Masukkan No. Telepon anda yang terdaftar sesuai dengan akun anda.'),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Nomor Telepon',
                        prefixIcon: const Icon(FluentIcons.call_24_regular),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(() => const LupaTeleponView());
                          },
                          child: CText(
                            'Lupa/Ganti No. Telepon',
                            color: primaryColor,
                          ),
                        ),
                      ],
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
