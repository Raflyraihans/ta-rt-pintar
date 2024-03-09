import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/donation.dart';
import 'package:rtkita/app/modules/donation/controllers/donation_controller.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/providers/donation.dart';
import 'package:rtkita/app/utils/currency_format.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/dashed_rect.dart';
import 'package:rtkita/widgets/dialog.dart';
import 'package:rtkita/widgets/text.dart';

class DonasiView extends GetView {
  final Donation donation;
  DonasiView(this.donation, {Key? key}) : super(key: key);
  DonationProvider donationProvider = DonationProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                // ignore: prefer_const_constructors
                Expanded(
                  flex: 2,
                  child: const Center(
                    child: Text(
                      'Iuran Warga',
                      style: TextStyle(
                        // ignore: unnecessary_const
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
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          GetBuilder<DonationController>(
                              init: DonationController(),
                              builder: (c) {
                                return InkWell(
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
                                                      c.setImage(await picker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .camera,
                                                              maxHeight: 640));
                                                    } on PlatformException {
                                                      errorMessage(
                                                          'Platform Error');
                                                    } catch (e) {
                                                      errorMessage(
                                                          "Terjadi kesalahan dalam mengambil gambar");
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
                                                      c.setImage(await picker
                                                          .pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery,
                                                              maxHeight: 640));
                                                    } on PlatformException {
                                                      errorMessage(
                                                          'Platform Error');
                                                    } catch (e) {
                                                      errorMessage(
                                                          "Terjadi kesalahan dalam memilih gambar");
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
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 12,
                                      ),
                                      height: 160,
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      child: DottedBorder(
                                          radius: Radius.circular(
                                            10,
                                          ),
                                          color: subtextColor,
                                          strokeWidth: 2,
                                          dashPattern: <double>[8],
                                          child: c.dataImage == null
                                              ? Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.image,
                                                          color: subtextColor,
                                                          size: 24,
                                                        ),
                                                        Icon(
                                                          Icons.camera_alt,
                                                          color: subtextColor,
                                                          size: 24,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    CText(
                                                      "Gambar/Foto Bukti Bayar",
                                                      color: subtextColor,
                                                      fontSize: 16,
                                                    )
                                                  ],
                                                )
                                              : Image.file(
                                                  File(c.dataImage!.path),
                                                  width: double.infinity,
                                                ))),
                                );
                              })
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GetBuilder<DonationController>(
                                init: DonationController(),
                                builder: (c) {
                                  return TextField(
                                    keyboardType: TextInputType.number,
                                    controller: c.jumlah,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'Nominal iuran yang dibayar..',
                                      prefixIcon: const Icon(
                                          FluentIcons.money_24_regular),
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: 24,
                            ),
                            GetBuilder<DonationController>(
                                init: DonationController(),
                                builder: (c) {
                                  return GetBuilder<HomeController>(
                                      init: HomeController(),
                                      builder: (homec) {
                                        return PrimaryButton(
                                            text: 'Kirim Bukti Bayar',
                                            onTap: () {
                                              homec.loading == true
                                                  ? null
                                                  : donationProvider
                                                      .sendDonation(
                                                          donation.id);
                                            });
                                      });
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
