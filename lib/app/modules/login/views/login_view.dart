import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/modules/lupa_password/views/lupa_password_view.dart';
import 'package:rtkita/app/modules/verif_kk/views/verif_kk_view.dart';
import 'package:rtkita/app/providers/auth.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/dialog.dart';
import 'package:rtkita/widgets/header_section.dart';
import 'package:rtkita/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final AuthProvider loginProvider = AuthProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBuilder(
        child: SafeArea(
          child: SingleChildScrollView(
              child: GetBuilder<LoginController>(
                  init: LoginController(),
                  builder: (c) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const HeaderSection(
                            headerText: 'Login',
                            subText:
                                'Halo Warga! Selamat Datang!\nLogin terlebih dahulu agar bisa bergabung\ndengan warga lain.',
                          ),
                          const SizedBox(
                            height: 32,
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
                            obscureText: c.obscureText,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: 'Password',
                              prefixIcon: const Icon(
                                  FluentIcons.lock_closed_24_regular),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  c.setObscure(!c.obscureText);
                                },
                                icon: Icon(!c.obscureText
                                    ? FluentIcons.eye_24_regular
                                    : FluentIcons.eye_off_24_regular),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(() => const LupaPasswordView());
                                },
                                child: CText(
                                  'Lupa Password?',
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            transform: Matrix4.translationValues(-16, 0, 0),
                            child: Row(
                              children: [
                                Checkbox(
                                    value: c.terms,
                                    onChanged: (value) {
                                      c.setTerms(value!);
                                    }),
                                CText('Saya Menyetujui '),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                        Uri.parse(
                                            'https://sites.google.com/view/terms-and-condition-rt-kita/home'),
                                        mode: LaunchMode.externalApplication);
                                  },
                                  child: CText(
                                    'Terms and condition',
                                    color: primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          PrimaryButton(
                              text: 'Masuk',
                              onTap: () {
                                c.terms == false
                                    ? Get.dialog(SimpleBoxDialog(
                                        title: 'Setujui terms and condition!',
                                        subtitle:
                                            'Untuk dapat melanjutkan kamu harus menyetujui terms and condition',
                                        buttonText: 'Tutup',
                                        onTapPrimary: () {
                                          Get.back();
                                        },
                                      ))
                                    : loginProvider.login();
                              }),
                          SecondaryButton(
                              text: 'Belum Punya Akun?',
                              onTap: () {
                                Get.to(() => VerifKkView());
                              }),
                          const SizedBox(
                            height: 24,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CText(
                                'Lupa Akun?',
                                color: textColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              CText(
                                'Bantuan',
                                color: primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  })),
        ),
      ),
    );
  }
}
