import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/providers/auth.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/header_section.dart';
import 'package:rtkita/widgets/text.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);

  final AuthProvider registerProvider = AuthProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBuilder(
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(children: [
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
              GetBuilder<RegisterController>(
                  init: RegisterController(),
                  builder: (c) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HeaderSection(
                            headerText: 'Register',
                            subText:
                                'Halo Warga Baru! Selamat Datang!\nRegister terlebih dahulu agar bisa bergabung\ndengan warga lain.',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: c.namaLengkap,
                            onTap: () {
                              listUser(context);
                            },
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Nama Lengkap',
                              prefixIcon:
                                  const Icon(FluentIcons.person_24_regular),
                              suffixIcon: const Icon(Icons.keyboard_arrow_down),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextField(
                            controller: c.nik,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'NIK',
                              prefixIcon:
                                  const Icon(FluentIcons.person_24_regular),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextField(
                            controller: c.ttl,
                            readOnly: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: 'Tempat, Tanggal Lahir',
                                prefixIcon: const Icon(
                                    FluentIcons.calendar_month_24_regular)),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          CText(
                            'Jenis Kelamin',
                            color: subtextColor,
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: subtextColor),
                                    ),
                                    child: c.gender == 'Laki-Laki'
                                        ? Center(
                                            child: Container(
                                              height: 12,
                                              width: 12,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: subtextColor),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CText(
                                    'Laki-laki',
                                    color: subtextColor,
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: subtextColor),
                                    ),
                                    child: c.gender == 'Perempuan'
                                        ? Center(
                                            child: Container(
                                              height: 12,
                                              width: 12,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: subtextColor),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  CText(
                                    'Perempuan',
                                    color: subtextColor,
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextField(
                            controller: c.pekerjaan,
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Pekerjaan',
                              prefixIcon:
                                  const Icon(FluentIcons.person_24_regular),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextField(
                            controller: c.telepon,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Nomor Telepon',
                              prefixIcon:
                                  const Icon(FluentIcons.call_24_regular),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextField(
                            controller: c.password,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Password',
                              prefixIcon: const Icon(
                                  FluentIcons.lock_closed_24_regular),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(FluentIcons.eye_off_24_regular),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          PrimaryButton(
                              text: 'Register',
                              onTap: () {
                                registerProvider.register(context);
                              }),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    );
                  })
            ]),
          ),
        ),
      ),
    );
  }
}
