import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rtkita/app/modules/aduan/views/detail_aduan_view.dart';
import 'package:rtkita/app/modules/manajemenAduanWarga/controllers/manajemen_aduan_warga_controller.dart';
import 'package:rtkita/app/providers/complaint.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/body_builder.dart';
import 'package:rtkita/widgets/button.dart';
import 'package:rtkita/widgets/text.dart';

class ManajemenAduanWargaView extends GetView<ManajemenAduanWargaController> {
  const ManajemenAduanWargaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ManajemenAduanWargaController manajemenAduanWargaController =
        Get.put(ManajemenAduanWargaController());
    return Scaffold(
      backgroundColor: Colors.white,
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
                  // ignore: prefer_const_constructors
                  Expanded(
                    flex: 2,
                    child: const Center(
                      child: Text(
                        'Manajemen Aduan',
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
                  child: GetBuilder<ManajemenAduanWargaController>(
                      init: ManajemenAduanWargaController(),
                      builder: (c) {
                        return ListView.builder(
                            itemCount: c.aduanWarga.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() =>
                                      DetailAduanView(c.aduanWarga[index]));
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 24),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          offset: const Offset(0, 1),
                                          blurRadius: 15.0),
                                    ],
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 160,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          child: c.aduanWarga[index]
                                                      .complaintDocuments ==
                                                  null
                                              ? Container()
                                              : Hero(
                                                  tag: c
                                                          .aduanWarga[index]
                                                          .complaintDocuments!
                                                          .isNotEmpty
                                                      ? c
                                                          .aduanWarga[index]
                                                          .complaintDocuments!
                                                          .first
                                                          .document!
                                                      : 'https://jdih.kominfo.go.id/storage/pictures/default.jpg',
                                                  child: CachedNetworkImage(
                                                    imageUrl: c
                                                            .aduanWarga[index]
                                                            .complaintDocuments!
                                                            .isNotEmpty
                                                        ? c
                                                            .aduanWarga[index]
                                                            .complaintDocuments!
                                                            .first
                                                            .document!
                                                        : 'https://jdih.kominfo.go.id/storage/pictures/default.jpg',
                                                    height: 160,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                    placeholder:
                                                        ((context, url) {
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          20),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          20),
                                                                ),
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.4)),
                                                        child: const Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 12,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            CText(
                                              c.aduanWarga[index].title!,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            CText(
                                              DateFormat('d/M/y').format(
                                                  DateTime.parse(c
                                                      .aduanWarga[index]
                                                      .createdAt!
                                                      .split('T')
                                                      .first)),
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal,
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: SecondaryButton(
                                                      text: 'Tolak',
                                                      onTap: () {
                                                        final AduanProvider
                                                            aduanProvider =
                                                            AduanProvider();
                                                        aduanProvider
                                                            .updateStatusComplaint(
                                                                c
                                                                    .aduanWarga[
                                                                        index]
                                                                    .id!,
                                                                'ditolak');
                                                      }),
                                                ),
                                                const SizedBox(
                                                  width: 12,
                                                ),
                                                Expanded(
                                                  child: PrimaryButton(
                                                      text: 'Posting',
                                                      onTap: () {
                                                        final AduanProvider
                                                            aduanProvider =
                                                            AduanProvider();
                                                        aduanProvider
                                                            .updateStatusComplaint(
                                                                c
                                                                    .aduanWarga[
                                                                        index]
                                                                    .id!,
                                                                'diposting');
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
