import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/components/dialog.dart';
import 'package:rtkita/app/model/complaint.dart';
import 'package:rtkita/app/modules/home/controllers/home_controller.dart';
import 'package:rtkita/app/modules/tab_decider/controllers/tab_decider_controller.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/dialog.dart';
import 'package:rtkita/widgets/full_screen_image.dart';
import 'package:rtkita/widgets/text.dart';

class DetailAduanView extends GetView {
  final Complaint aduan;
  const DetailAduanView(this.aduan, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyBuilder(
        child: SafeArea(
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
                  const Expanded(
                    flex: 2,
                    child: Center(
                      child: Text(
                        'Detail Aduan',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'roboto',
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      transform: Matrix4.translationValues(20, 0, 0),
                      child: IconButton(
                        icon: Icon(FluentIcons.flag_24_regular),
                        onPressed: () {
                          Get.bottomSheet(Container(
                              padding: EdgeInsets.symmetric(vertical: 24),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.dialog(SimpleBoxDialog(
                                        title: 'Report?',
                                        buttonText: 'Ya',
                                        secondaryButtonText: 'Batal',
                                        subtitle:
                                            'Deskripsikan masalahmu terkait postingan ini',
                                        onTapSecondary: () {
                                          Get.back();
                                        },
                                        onTapPrimary: () async {
                                          Get.back();
                                          Get.back();
                                          HomeController homeController =
                                              Get.find<HomeController>();
                                          homeController.loadingStatus(true);
                                          await Future.delayed(
                                              Duration(seconds: 2));
                                          homeController.loadingStatus(false);
                                          successMessage(
                                              context, 'Berhasil direport');
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextFormField(
                                              keyboardType: TextInputType.text,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: 'Deskripsi'),
                                            )
                                          ],
                                        ),
                                      ));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 8),
                                      child: Row(
                                        children: [
                                          CText('Laporkan masalah?'),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )));
                        },
                      ),
                    ),
                  ),
                ]),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: aduan.complaintDocuments!.isNotEmpty
                            ? aduan.complaintDocuments!.first.document!
                            : 'https://jdih.kominfo.go.id/storage/pictures/default.jpg',
                        child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: GestureDetector(
                                onTap: () {
                                  if (aduan.complaintDocuments!.isNotEmpty) {
                                    Get.to(() => FullScreenImage(
                                        image: aduan.complaintDocuments!.first
                                            .document!));
                                  }
                                },
                                child: CachedNetworkImage(
                                  imageUrl: aduan.complaintDocuments!.isEmpty
                                      ? 'https://jdih.kominfo.go.id/storage/pictures/default.jpg'
                                      : aduan
                                          .complaintDocuments!.first.document!,
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.grey.withOpacity(0.4)),
                                  ),
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CText(
                        aduan.title!,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      CText(
                        aduan.createdAt!.split('T')[0],
                        fontSize: 14,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      CText(
                        aduan.description!,
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GetBuilder<TabDeciderController>(
                          init: TabDeciderController(),
                          builder: (c) {
                            return c.user!.administrator != 1
                                ? Container()
                                : Text('Pelapor: ' +
                                    (aduan.familyMemberName ?? ''));
                          }),
                      // Text('Notes: ' + (aduan.note ?? '-')),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
