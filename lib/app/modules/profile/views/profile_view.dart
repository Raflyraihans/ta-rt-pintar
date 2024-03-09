import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/modules/lupa_password/views/lupa_password_view.dart';
import 'package:rtkita/app/modules/tab_decider/controllers/tab_decider_controller.dart';
import 'package:rtkita/app/modules/tab_decider/views/about_view.dart';
import 'package:rtkita/app/modules/tab_decider/views/privacy_view.dart';
import 'package:rtkita/app/modules/tab_decider/views/terms_view.dart';
import 'package:rtkita/app/providers/auth.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/dialog.dart';
import 'package:rtkita/widgets/list_action.dart';
import 'package:rtkita/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CText(
                    'Profile',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
                child: GetBuilder<TabDeciderController>(
              init: TabDeciderController(),
              builder: (c) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 72,
                                width: 72,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.5),
                                    shape: BoxShape.circle),
                                child: c.user!.avatar != ''
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: CachedNetworkImage(
                                          imageUrl: c.user!.avatar!,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : Center(
                                        child: Icon(
                                          FluentIcons.person_24_regular,
                                          color: Colors.grey,
                                          size: 32,
                                        ),
                                      ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
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
                                                      AuthProvider
                                                          authProvider =
                                                          AuthProvider();
                                                      authProvider
                                                          .editProfile(data);
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
                                                      AuthProvider
                                                          authProvider =
                                                          AuthProvider();
                                                      authProvider
                                                          .editProfile(data);
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
                                    height: 24,
                                    width: 24,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        shape: BoxShape.circle),
                                    child: const Center(
                                        child: Icon(
                                      FluentIcons.edit_24_regular,
                                      color: Colors.white,
                                      size: 16,
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CText(
                                c.user!.familyMemberName!,
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              CText(
                                'NIK: ${c.user!.nik!}',
                                fontSize: 16,
                                color: subtextColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      PrimaryButton(
                          text: 'Ganti No.Telepon/Password',
                          onTap: () {
                            Get.to(() => LupaPasswordView());
                          }),
                      // GetBuilder<TabDeciderController>(
                      //     init: TabDeciderController(),
                      //     builder: (c) {
                      //       return SecondaryButton(
                      //           text: 'QR Code',
                      //           onTap: () {
                      //             Get.dialog(SimpleBoxDialog(
                      //               title: 'QR Code Anda',
                      //               child: Center(
                      //                 child: QrImage(
                      //                   data: c.user!.nik! +
                      //                       '.' +
                      //                       c.user!.address!,
                      //                   version: QrVersions.auto,
                      //                   size: 200.0,
                      //                 ),
                      //               ),
                      //             ));
                      //           });
                      //     }),
                      ListAction(
                        text: 'Terms & Condition',
                        onTap: () {
                          launchUrl(
                              Uri.parse(
                                  'https://sites.google.com/view/terms-and-condition-rt-kita/home'),
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                      ListAction(
                        text: 'Privacy Policy',
                        onTap: () {
                          Get.to(() => const PrivacyView());
                        },
                      ),
                      ListAction(
                        text: 'About App',
                        onTap: () {
                          Get.to(() => const AboutView());
                        },
                      ),
                      ListAction(
                        text: 'Hapus akun',
                        onTap: () {
                          final AuthProvider authProvider = AuthProvider();
                          confirmMessage(context, 'Yakin ingin menghapus akun?',
                              'Anda perlu melakukan pendaftaran ulang akun anda',
                              () {
                            Get.back();
                            authProvider.logout(context);
                          });
                        },
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      InkWell(
                        onTap: () {
                          final AuthProvider authProvider = AuthProvider();
                          confirmMessage(context, 'Yakin ingin logout?',
                              'Anda perlu login kembali untuk menggunakan Aplikasi',
                              () {
                            Get.back();
                            authProvider.logout(context);
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Icon(
                                FluentIcons.sign_out_24_regular,
                                color: dangerRed,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: dangerRed,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
