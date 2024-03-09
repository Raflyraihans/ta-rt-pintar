import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtkita/app/modules/persuratan/controllers/persuratan_controller.dart';
import 'package:rtkita/app/modules/register/controllers/register_controller.dart';
import 'package:rtkita/app/modules/register/views/register_view.dart';
import 'package:rtkita/app/modules/verif_kk/controllers/verif_kk_controller.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/notification_service.dart';
import 'package:rtkita/widgets/dialog.dart';
import 'package:rtkita/widgets/text.dart';

void accountChecker(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleBoxDialog(
        title: 'Konfirmasi Data',
        subtitle:
            'Apakah data berikut benar milik anda?\nJika data anda salah, silakan hubungi',
        buttonText: 'Konfirmasi',
        secondaryButtonText: 'Batal',
        onTapSecondary: () {
          Get.back();
        },
        onTapPrimary: () async {
          Get.back();
          Get.to(() => RegisterView());
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                //TODO Nomor pengurus
              },
              child: CText(
                'PENGURUS',
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder<VerifKkController>(
              init: VerifKkController(),
              builder: (c) {
                return SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CText(
                            'No. Rumah',
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CText(
                            c.familyCard!.house!.houseNumber!,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
    },
  );
}

void listUser(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (c) {
            return SimpleBoxDialog(
                title: 'Pilih anggota keluarga',
                subtitle: 'Silakan pilih anggota yang ingin didaftarkan',
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: c.familyMember.length,
                        itemBuilder: (context, index) {
                          return Material(
                            color: Colors.white,
                            child: ListTile(
                              leading:
                                  const Icon(FluentIcons.person_24_regular),
                              title: Text(
                                  c.familyMember[index]!.familyMemberName!),
                              onTap: () {
                                c.selectFamilyMember(c.familyMember[index]);
                                Get.back();
                              },
                            ),
                          );
                        }),
                  ],
                ));
          });
    },
  );
}

void listUserSurat(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GetBuilder<PersuratanController>(
          init: PersuratanController(),
          builder: (c) {
            return SimpleBoxDialog(
                title: 'Pilih anggota keluarga',
                subtitle: 'Silakan pilih anggota yang ingin dituju',
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: c.familyMember.length,
                        itemBuilder: (context, index) {
                          return Material(
                            color: Colors.white,
                            child: ListTile(
                              leading:
                                  const Icon(FluentIcons.person_24_regular),
                              title: Text(
                                  c.familyMember[index]!.familyMemberName!),
                              onTap: () {
                                c.selectFamilyMember(c.familyMember[index]);
                                Get.back();
                              },
                            ),
                          );
                        }),
                  ],
                ));
          });
    },
  );
}

void confirmMessage(context, title, description, VoidCallback action) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleBoxDialog(
        title: title,
        subtitle: description,
        buttonText: 'Konfirmasi',
        secondaryButtonText: 'Batal',
        onTapSecondary: () {
          Get.back();
        },
        onTapPrimary: action,
      );
    },
  );
}

void errorMessage(message) {
  Get.dialog(SimpleBoxDialog(
    title: 'Terjadi Kesalahan',
    subtitle: message.toString(),
    buttonText: 'Tutup',
    onTapPrimary: () {
      Get.back();
    },
  ));
}

void successMessage(context, message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleBoxDialog(
        title: 'Berhasil',
        subtitle: message.toString(),
        buttonText: 'Tutup',
        onTapPrimary: () {
          Get.back();
        },
      );
    },
  );
}
