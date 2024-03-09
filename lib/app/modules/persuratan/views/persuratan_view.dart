// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:rtkita/app/model/cover_letter.dart';
import 'package:rtkita/app/modules/persuratan/views/add_persuratan_view.dart';
import 'package:rtkita/app/providers/persuratan.dart';
import 'package:rtkita/app/utils/string.dart';
import 'package:rtkita/env/color.dart';
import 'package:rtkita/widgets/shimmer_loading.dart';
import 'package:rtkita/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/persuratan_controller.dart';

class PersuratanView extends GetView<PersuratanController> {
  PersuratanView({Key? key}) : super(key: key);

  final PersuratanProvider persuratanProvider = PersuratanProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Shimmer(
        linearGradient: shimmerGradient,
        child: SafeArea(
          child: Stack(
            children: [
              Column(
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
                            'Persuratan',
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
                        child: Container(),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        child: Column(
                          children: [
                            // TextField(
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(10)),
                            //     hintText: 'Cari Surat',
                            //     prefixIcon:
                            //         const Icon(FluentIcons.search_24_regular),
                            //   ),
                            // ),
                            GetBuilder<PersuratanController>(
                                init: PersuratanController(),
                                initState: (state) async {
                                  PersuratanController persuratanController =
                                      Get.put(PersuratanController());
                                  persuratanController.setCoverLetter(
                                      await persuratanProvider
                                          .getListSurat(context));
                                },
                                builder: (snapshot) {
                                  return snapshot.coverLetter == null
                                      ? ShimmerLoading(
                                          isLoading: true,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 245,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 15),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  gradient: shimmerGradient,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        offset:
                                                            const Offset(0, 1),
                                                        blurRadius: 15.0),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 245,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 15),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10),
                                                decoration: BoxDecoration(
                                                  gradient: shimmerGradient,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        offset:
                                                            const Offset(0, 1),
                                                        blurRadius: 15.0),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount:
                                              snapshot.coverLetter!.length,
                                          itemBuilder: (context, index) {
                                            List tanggal = snapshot
                                                .coverLetter![index]!.createdAt!
                                                .split('T')
                                                .first
                                                .split('-');
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 24,
                                                      vertical: 24),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      offset:
                                                          const Offset(0, 1),
                                                      blurRadius: 15.0),
                                                ],
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CText(
                                                    snapshot.coverLetter![index]!.description!,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  CText(
                                                      'Pemohon: ${snapshot.coverLetter![index]!.createdBy!}'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  CText(
                                                      'Dituju: ${snapshot.coverLetter![index]!.familyMember!.familyMemberName!}'),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  CText(
                                                      '${'Tanggal: ' + tanggal[2] + '/' + tanggal[1]}/' +
                                                          tanggal[0]),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Row(
                                                    children: [
                                                      const CText('Status: '),
                                                      const SizedBox(
                                                        width: 1,
                                                      ),
                                                      CText(
                                                        snapshot
                                                            .coverLetter![
                                                                index]!
                                                            .status!
                                                            .toCapitalized(),
                                                        color: snapshot
                                                                    .coverLetter![
                                                                        index]!
                                                                    .status! ==
                                                                'diterima'
                                                            ? Colors.green
                                                            : snapshot
                                                                        .coverLetter![
                                                                            index]!
                                                                        .status! ==
                                                                    'menunggu'
                                                                ? Colors.orange
                                                                : Colors.red,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 12,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14),
                                                      border: Border.all(
                                                          color: subtextColor),
                                                    ),
                                                    child: Material(
                                                      color: Colors.transparent,
                                                      child: InkWell(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(14),
                                                        onTap: () async {
                                                          if (snapshot
                                                                  .coverLetter![
                                                                      index]!
                                                                  .status! ==
                                                              'diterima') {
                                                            try {
                                                              await launchUrl(
                                                                  Uri.parse(snapshot
                                                                      .coverLetter![
                                                                          index]!
                                                                      .file
                                                                      .toString()),
                                                                  mode: LaunchMode
                                                                      .externalApplication);
                                                            } on PlatformException {
                                                              // Handle err
                                                            } catch (err) {
                                                              // other types of Exceptions
                                                            }
                                                          }
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(24),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  SvgPicture.asset(
                                                                      'assets/image/word.svg'),
                                                                  const SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  SizedBox(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.45,
                                                                    child:
                                                                        CText(
                                                                      snapshot
                                                                          .coverLetter![
                                                                              index]!
                                                                          .description!,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          15,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      color: snapshot.coverLetter![index]!.status! ==
                                                                              'diterima'
                                                                          ? Colors
                                                                              .black
                                                                          : subtextColor,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Icon(
                                                                FluentIcons
                                                                    .arrow_download_24_regular,
                                                                color:
                                                                    subtextColor,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 30,
                right: 30,
                child: Container(
                  height: 65,
                  width: 65,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          offset: const Offset(0, 1),
                          blurRadius: 8.0),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        Get.to(() => const AddPersuratanView());
                      },
                      child: const Center(
                        child: Icon(
                          FluentIcons.add_24_regular,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
