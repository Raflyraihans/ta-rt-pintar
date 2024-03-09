import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/modules/login/views/login_view.dart';
import 'package:rtkita/app/modules/tab_decider/views/tab_decider_view.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/dialog.dart';
import 'package:rtkita/widgets/header_section.dart';
import 'package:rtkita/widgets/text.dart';

import '../controllers/verif_otp_controller.dart';

class VerifOtpView extends GetView<VerifOtpController> {
  final int otpCode;
  VerifOtpView(this.otpCode, {Key? key}) : super(key: key);

  TextEditingController otp = TextEditingController();
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
                      headerText: 'Verifikasi',
                      subheaderText: 'OTP',
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Image.asset('assets/image/verif_otp.png'),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: const [
                        CText(
                          'Kode OTP akan dikirimkan ke No. Telepon\nyang anda daftarkan.',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: otp,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: 'Kode OTP',
                        prefixIcon:
                            const Icon(FluentIcons.lock_closed_24_regular),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    PrimaryButton(
                      onTap: () {
                        if (otp.text == otpCode.toString()) {
                          Get.offAll(() => LoginView());
                        } else {
                          Get.dialog(SimpleBoxDialog(
                            title: 'Terjadi Kesalahan',
                            subtitle: 'Otp Salah',
                            buttonText: 'Tutup',
                            onTapPrimary: () {
                              Get.back();
                            },
                          ));
                        }
                      },
                      text: 'Kirim',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const CText(
                      '04:49',
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CText(
                      'Kirim ulang kode OTP',
                      color: primaryColor,
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
